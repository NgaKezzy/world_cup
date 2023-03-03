import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:worldcup_app/services/storage/local_storage_service.dart';

class GoogleApiAds {
  static final GoogleApiAds _googleApiAds = GoogleApiAds._internal();

  factory GoogleApiAds() {
    return _googleApiAds;
  }

  GoogleApiAds._internal();

  String bannerId = Platform.isAndroid
      ? 'ca-app-pub-9289471944485373/7334647348'
      : 'ca-app-pub-9289471944485373/1259020126';
  String interstitialId = Platform.isAndroid
      ? 'ca-app-pub-9289471944485373/2819320281'
      : 'ca-app-pub-9289471944485373/5317722629';
  BannerAd? bannerAd;
  InterstitialAd? interstitialAd;

  BannerAd buildBannerAd(String bannerId) {
    return BannerAd(
      adUnitId: bannerId,
      size: AdSize(width: 320, height: 50),
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          print('Đã load xong quảng cáo');
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          ad.dispose();
          bannerAd = null;
          print('Ad failed to load: $error');
        },
        // Called when an ad opens an overlay that covers the screen.
        onAdOpened: (Ad ad) => print('Ad opened.'),
        onAdClosed: (Ad ad) => initAd('banner', bannerId),
        onAdImpression: (Ad ad) => print('Ad impression.'),
      ),
    );
  }

  Future buildInterstitialAd(String interstitialId) async {
    await InterstitialAd.load(
      adUnitId: interstitialId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          print('$ad loaded');
          interstitialAd = ad;
          interstitialAd!.setImmersiveMode(true);
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('InterstitialAd failed to load: $error.');
          interstitialAd = null;
        },
      ),
    );
  }

  void showInterstitialAd() async {
    if (interstitialAd == null) {
      print('Warning: attempt to show interstitial before loaded.');
      return;
    }
    interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
          print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        LocalStorageService().setBool('isFirstLoad', false);
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        initAd('interstitial', interstitialId);
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
      },
    );
    await interstitialAd!.show();
    interstitialAd = null;
  }

  Future initAd(String type, String id) async {
    switch (type) {
      case 'banner':
        bannerAd = buildBannerAd(id);
        await bannerAd?.load();
        break;
      case 'interstitial':
        await buildInterstitialAd(interstitialId);

        break;
      default:
    }
  }
}
