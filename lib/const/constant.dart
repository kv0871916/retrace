import 'package:provider/provider.dart';
import '../provider/auth/social_provider.dart';

var allprovider = [
  ChangeNotifierProvider<SocialProvider>(
    create: (context) => SocialProvider(),
  ),
];
