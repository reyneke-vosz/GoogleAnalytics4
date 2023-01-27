<?php

/*
 * vanilla-thunder/oxid-module-gtm
 * Google Tag Manager Integration for OXID eShop v6.2+
 *
 * This program is free software;
 * you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation;
 * either version 3 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
 *  without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
 * You should have received a copy of the GNU General Public License along with this program; if not, see <http://www.gnu.org/licenses/>
 */

namespace D3\GoogleAnalytics4\Modules\Core;

use OxidEsales\Eshop\Application\Controller\FrontendController;
use OxidEsales\Eshop\Core\Registry;
use OxidEsales\EshopCommunity\Internal\Container\ContainerFactory;
use OxidEsales\EshopCommunity\Internal\Framework\Module\Configuration\Bridge\ModuleSettingBridgeInterface;

class ViewConfig extends ViewConfig_parent
{

    // Google Tag Manager Container ID
    private $sContainerId = null;

    public function getGtmContainerId()
    {
        if ($this->sContainerId === null)
        {
            $this->sContainerId = $this->getConfig()->getConfigParam('d3_gtm_sContainerID');
        }
        return $this->sContainerId;
    }

    private $blGA4enabled = null;

    public function isGA4enabled()
    {
        if ($this->blGA4enabled === null)
        {
            $this->sContainerId = $this->getConfig()->getConfigParam('d3_gtm_blEnableGA4');
        }

        return $this->blGA4enabled;
    }

    public function getGtmDataLayer()
    {
        if (!$this->getGtmContainerId()) return "[]";

        $oConfig = Registry::getConfig();
        $oView   = $oConfig->getTopActiveView();
        /** @var FrontendController $oShop */
        //$oShop = oxRegistry::getConfig()->getActiveShop(); /** @var oxShop $oShop */
        $oUser = $oConfig->getUser();

        $cl         = $this->getTopActionClassName();
        $aPageTypes = [
            "content"  => "cms",
            "details"  => "product",
            "alist"    => "listing",
            "search"   => "listing",
            "basket"   => "checkout",
            "user"     => "checkout",
            "payment"  => "checkout",
            "order"    => "checkout",
            "thankyou" => "checkout",
        ];

        $dataLayer = [
            'page'      => [
                'type'  => $aPageTypes[$cl] ?? "unknown",
                'title' => $oView->getTitle(),
                'cl'    => $cl,
            ],
            'userid'    => ($oUser ? $oUser->getId() : false),
            'sessionid' => session_id() ?? false,
            //'httpref'   => $_SERVER["HTTP_REFERER"] ?? "unknown"
        ];

        return json_encode([$dataLayer], JSON_PRETTY_PRINT);

        unset($dataLayer["user"]["http"]); // das brauchen wir hier nicht


    public function isPromotionList($listId)
    {
        $oConfig           = Registry::getConfig();
        $aPromotionListIds = $oConfig->getConfigParam("") ?? ['bargainItems', 'newItems', 'topBox', 'alsoBought', 'accessories', 'cross'];
    }
}