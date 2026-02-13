
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bettsix/repo/jili_game_launchere_repo.dart';
import 'package:bettsix/res/color-const.dart';
import 'package:bettsix/utils/utils.dart';
import 'package:bettsix/view_model/update_jili_wallet_view_model.dart';
import 'package:bettsix/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../res/app_constant.dart';
import '../utils/routes/routes_name.dart';
import '../view/game/Aviator/res/app_button.dart';
import '../view/game/wingo/res/gradient_app_bar.dart';

class JiliGameLauncherViewModel with ChangeNotifier {
  final _jiliGameRepo = JiliGameLaunchereRepo();
  bool _loading = false;
  bool _isGameLaunched = false;

  bool get isGameLaunched => _isGameLaunched;

  setIsGameLaunched(bool value) {
    _isGameLaunched = value;
    notifyListeners();
  }

  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> jiligame(dynamic gameId,dynamic name, BuildContext context) async {
    UserViewModel userViewModel = UserViewModel();
    String? userId = await userViewModel.getUser();
    setLoading(true);

    Map<String, dynamic> data = {
      "user_id": userId,
      "game_uid": gameId,
    };
print("Amana====$data");
    try {
      final value = await _jiliGameRepo.jiligame(data);
      if (value['status'] == true) {
        setLoading(false);
        String gameUrl = value['game_url'];
        debugPrint("Game URL: $gameUrl");
        // Provider.of<UpdateJiliWalletViewModel>(context,listen: false).updateJiliWallletApi(context);
        launchURL(gameUrl,name,context);
      } else {
        setLoading(false);
        Utils.setSnackBar(value['message'], AppColor.red, context);
      }
    } catch (error) {
      setLoading(false);
      debugPrint('Error launching game: $error');
    }
  }

  static Future<void> launchURL(String url,String name,context) async {
    try {
      Uri uri = Uri.parse(url);
      debugPrint("Trying to launch: $uri");

      if (await canLaunchUrl(uri)) {
        if (kIsWeb) {
          /// 🌐 WEB → open external launcher
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          }
        } else {
          /// 📱 MOBILE → open WebView screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => GameWebViewScreen(url: url,name:name),
            ),
          );
        }
      } else {
        debugPrint("Could not launch: $uri");
      }
    } catch (e) {
      debugPrint("Error launching URL: $e");
    }
  }
}



class GameWebViewScreen extends StatelessWidget {
  final String url;
  final String name;

  const GameWebViewScreen({super.key, required this.url,required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:    GradientAppBar(
        centerTitle: true,
        leading: const AppBackBtn(),
        title: Text(name,style: const TextStyle(color: AppColor.white,fontFamily: "SitkaSmall"),),

      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

