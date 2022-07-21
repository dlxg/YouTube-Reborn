function save_options() {
    chrome.storage.sync.set({
        // Global Options
        blockAdsOption: document.getElementById('blockAdsCheckBox').checked,
        qualityOption: document.getElementById('qualities').value,
        disablePlayOnStartOption: document.getElementById('disablePlayOnStartCheckBox').checked,
        // Video Options
        enablePictureInPictureButtonOption: document.getElementById('enablePictureInPictureButtonCheckBox').checked,
        disableAutoPlayOption: document.getElementById('disableAutoPlayCheckBox').checked,
        disableCaptionsOption: document.getElementById('disableCaptionsCheckBox').checked,
        disableHeatwaveOption: document.getElementById('disableHeatwaveCheckBox').checked,
        // NavBar Options
        hideVoiceSearchButtonOption: document.getElementById('hideVoiceSearchButtonCheckBox').checked,
        hideYouTubeLogoOption: document.getElementById('hideYouTubeLogoCheckBox').checked,
        hideCountrySymbolNextToLogoOption: document.getElementById('hideCountrySymbolNextToLogoCheckBox').checked,
        // Overlay Options
        hideAutoPlaySwitchOption: document.getElementById('hideAutoPlaySwitchCheckBox').checked,
        hideCaptionsButtonOption: document.getElementById('hideCaptionsButtonCheckBox').checked,
        hideInfoCardButtonOption: document.getElementById('hideInfoCardButtonCheckBox').checked,
        hideMiniplayerButtonOption: document.getElementById('hideMiniplayerButtonCheckBox').checked,
        hideTheaterModeButtonOption: document.getElementById('hideTheaterModeButtonCheckBox').checked,
        hidePreviousButtonOption: document.getElementById('hidePreviousButtonCheckBox').checked,
        hideNextButtonOption: document.getElementById('hideNextButtonCheckBox').checked,
        // Colour Options
        playerBarColourCheckBoxOption: document.getElementById('playerBarColourCheckBox').checked,
        playerBarColourOption: document.getElementById('playerBarColour').value,
        // Other Options
        hideRelatedVideosSectionOption: document.getElementById('hideRelatedVideosSectionCheckBox').checked,
        hideCommentsSectionOption: document.getElementById('hideCommentsSectionCheckBox').checked
    }, function() {
        var status = document.getElementById('status');
        status.textContent = 'Options Saved';
        setTimeout(function() {
            status.textContent = '';
        }, 750);
    });
}

function restore_options() {
    chrome.storage.sync.get({
        blockAdsOption: true,
        qualityOption: "auto",
        disablePlayOnStartOption: false,
        // Video Options
        enablePictureInPictureButtonOption: true,
        disableAutoPlayOption: false,
        disableCaptionsOption: false,
        disableHeatwaveOption: false,
        // NavBar Options
        hideVoiceSearchButtonOption: false,
        hideYouTubeLogoOption: false,
        hideCountrySymbolNextToLogoOption: false,
        // Overlay Options
        hideAutoPlaySwitchOption: false,
        hideCaptionsButtonOption: false,
        hideInfoCardButtonOption: false,
        hideMiniplayerButtonOption: false,
        hideTheaterModeButtonOption: false,
        hidePreviousButtonOption: false,
        hideNextButtonOption: false,
        // Colour Options
        playerBarColourCheckBoxOption: false,
        playerBarColourOption: "#000000",
        // Other Options
        hideRelatedVideosSectionOption: false,
        hideCommentsSectionOption: false
    }, function(items) {
        // Global Options
        document.getElementById('blockAdsCheckBox').checked = items.blockAdsOption;
        document.getElementById('qualities').value = items.qualityOption,
        document.getElementById('disablePlayOnStartCheckBox').checked = items.disablePlayOnStartOption,
        // Video Options
        document.getElementById('enablePictureInPictureButtonCheckBox').checked = items.enablePictureInPictureButtonOption;
        document.getElementById('disableAutoPlayCheckBox').checked = items.disableAutoPlayOption;
        document.getElementById('disableCaptionsCheckBox').checked = items.disableCaptionsOption;
        document.getElementById('disableHeatwaveCheckBox').checked = items.disableHeatwaveOption;
        // NavBar Options
        document.getElementById('hideVoiceSearchButtonCheckBox').checked = items.hideVoiceSearchButtonOption;
        document.getElementById('hideYouTubeLogoCheckBox').checked = items.hideYouTubeLogoOption;
        document.getElementById('hideCountrySymbolNextToLogoCheckBox').checked = items.hideCountrySymbolNextToLogoOption;
        // Overlay Options
        document.getElementById('hideAutoPlaySwitchCheckBox').checked = items.hideAutoPlaySwitchOption;
        document.getElementById('hideCaptionsButtonCheckBox').checked = items.hideCaptionsButtonOption;
        document.getElementById('hideInfoCardButtonCheckBox').checked = items.hideInfoCardButtonOption;
        document.getElementById('hideMiniplayerButtonCheckBox').checked = items.hideMiniplayerButtonOption;
        document.getElementById('hideTheaterModeButtonCheckBox').checked = items.hideTheaterModeButtonOption;
        document.getElementById('hidePreviousButtonCheckBox').checked = items.hidePreviousButtonOption;
        document.getElementById('hideNextButtonCheckBox').checked = items.hideNextButtonOption;
        // Colour Options
        document.getElementById('playerBarColourCheckBox').value = items.playerBarColourCheckBoxOption,
        document.getElementById('playerBarColour').value = items.playerBarColourOption,
        // Other Options
        document.getElementById('hideRelatedVideosSectionCheckBox').checked = items.hideRelatedVideosSectionOption;
        document.getElementById('hideCommentsSectionCheckBox').checked = items.hideCommentsSectionOption;
    });
}
  
document.addEventListener('DOMContentLoaded', restore_options);
document.getElementById('save').addEventListener('click', save_options);