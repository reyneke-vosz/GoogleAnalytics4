[{assign var="d3VtConfigObject" value=$oViewConf->getConfig()}]
[{if $d3VtConfigObject->getConfigParam('d3_gtm_settings_hasOwnCookieManager')}]
    [{if $oViewConf->D3blAcceptedCookie($d3VtConfigObject->getConfigParam('d3_gtm_settings_cookieName'))}]

        [{if $oViewConf->getGtmContainerId()}][{strip}]
        <!-- Google Tag Manager -->
        <script>
          var dataLayer = [{$oViewConf->getGtmDataLayer()}] || [];
          (function (w, d, s, l, i) {
            w[l] = w[l] || [];
            w[l].push({'gtm.start': new Date().getTime(), event: 'gtm.js'});
            var f = d.getElementsByTagName(s)[0], j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : '';
            j.async = true;
            j.src = 'https://www.googletagmanager.com/gtm.js?id=' + i + dl;
            f.parentNode.insertBefore(j, f);
          })(window, document, 'script', 'dataLayer', '[{$oViewConf->getGtmContainerId()}]');
        </script>
        <!-- End Google Tag Manager -->
        [{if $oViewConf->getTopActionClassName() === "alist" }]
        [{* include file="ga4_view_item_list.tpl" gtmCategory=$oView->getActiveCategory() gtmProducts=$oView->getArticleList() listtype=$oView->getListType() *}]
        [{elseif $oViewConf->getTopActionClassName() === "details" }]
        [{* include file="ga4_view_item.tpl" gtmProduct=$oView->getProduct() *}]
        [{elseif $oViewConf->getTopActionClassName() === "search" }]
        [{elseif $oViewConf->getTopActionClassName() === "basket" }]

        [{/if}]
        [{/strip}][{/if}]
    [{else}]
    <script>
      var dataLayer = [{$oViewConf->getGtmDataLayer()}] || [];
    </script>
    [{/if}]
[{else}]
    [{if $oViewConf->getGtmContainerId()}][{strip}]
    <!-- Google Tag Manager -->
    <script>
      var dataLayer = [{$oViewConf->getGtmDataLayer()}] || [];
      (function (w, d, s, l, i) {
        w[l] = w[l] || [];
        w[l].push({'gtm.start': new Date().getTime(), event: 'gtm.js'});
        var f = d.getElementsByTagName(s)[0], j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : '';
        j.async = true;
        j.src = 'https://www.googletagmanager.com/gtm.js?id=' + i + dl;
        f.parentNode.insertBefore(j, f);
      })(window, document, 'script', 'dataLayer', '[{$oViewConf->getGtmContainerId()}]');
    </script>
    <!-- End Google Tag Manager -->
    [{if $oViewConf->getTopActionClassName() === "alist" }]
    [{* include file="ga4_view_item_list.tpl" gtmCategory=$oView->getActiveCategory() gtmProducts=$oView->getArticleList() listtype=$oView->getListType() *}]
    [{elseif $oViewConf->getTopActionClassName() === "details" }]
    [{* include file="ga4_view_item.tpl" gtmProduct=$oView->getProduct() *}]
    [{elseif $oViewConf->getTopActionClassName() === "search" }]
    [{elseif $oViewConf->getTopActionClassName() === "basket" }]

    [{/if}]
    [{/strip}][{/if}]
[{/if}]

[{$smarty.block.parent}]
