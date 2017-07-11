
$(document).ready(() => {
    jQuery('#header-button-toggle').on('click', function () {
       let aside = jQuery('#header-aside').toggleClass('is-active');
       jQuery(this).toggleClass('is-active');
    });

    jQuery('div.thumbnail-container').hover(
        function() {
            let cover = $(this).find('div.cover');
            cover.css('background-color', itemHoverColor);
        }, function() {
            let cover = $(this).find('div.cover');
            cover.css('background-color', 'transparent');
        });


    jQuery('span#see-more').on('click', function() {

    });

    jQuery('li.tinwork-product-thumbnail > img').on('click', function () {
       let img = jQuery(this);
       let url = img.attr('data-image-large-src');
       let header = jQuery('#header-product-cover');
       header.css('background-image', 'url(' + url+ ')');
    });
});