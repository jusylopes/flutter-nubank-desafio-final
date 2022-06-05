import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_final/data/repositories/swagger_api_user_repository.dart';
import 'package:projeto_final/resources/las_colors.dart';
import 'package:projeto_final/resources/las_text_style.dart';
import 'package:projeto_final/ui/router/routers.dart';
import 'package:projeto_final/ui/views/components/app_bar.dart';
import 'package:projeto_final/ui/views/components/background.dart';
import 'package:projeto_final/ui/views/components/card_home_page.dart';
import 'package:projeto_final/ui/views/components/image_profile.dart';
import 'package:projeto_final/ui/views/components/menu_profile.dart';
import 'package:projeto_final/ui/views/home/cubit/home_cubit.dart';
import 'package:projeto_final/ui/views/home/cubit/home_states.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final userRepository = SwaggerApiUserRepository();
  bool loading = false;

  void logout() async {
    try {
      await userRepository.logout();
      //para retirar erro de gap
      if (!mounted) return;
      Navigator.of(context).popAndPushNamed(Routes.login);
    } catch (error) {
      debugPrint('$error');
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('teste'),
      onVisibilityChanged: (_) {
        context.read<HomePageCubit>().loadUser();
      },
      child: Stack(
        children: [
          const BackgroundPage(),
          Scaffold(
            appBar: const PreferredSize(
              preferredSize: Size.fromHeight(180.0),
              child: AppBarWidget(back: false),
            ),
            body: SafeArea(
              child: Center(
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 90.0),
                    Expanded(
                      child: GridView.count(
                        primary: false,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 8,
                        crossAxisCount: 2,
                        childAspectRatio: (1 / .5),
                        children: <Widget>[
                          MenuProfile(
                            textAppBar: 'Eventos',
                            iconMenu: Icons.calendar_month_outlined,
                            context: context,
                            route: Routes.event,
                          ),
                          MenuProfile(
                            textAppBar: 'Meus dados',
                            iconMenu: Icons.account_circle,
                            context: context,
                            route: Routes.editProfile,
                          ),
                          MenuProfile(
                            textAppBar: 'Meu histórico',
                            iconMenu: Icons.chrome_reader_mode,
                            context: context,
                            route: Routes.historic,
                          ),
                          MenuProfile(
                            textAppBar: 'Contato',
                            iconMenu: Icons.message,
                            context: context,
                            route: Routes.contact,
                          ),
                        ],
                      ),
                    ),
                    CardHomePage(),
                    TextButton.icon(
                      onPressed: logout,
                      icon: const Icon(
                        Icons.logout,
                        size: 25,
                        color: LasColors.buttonColor,
                      ),
                      label: const Text(
                        'Sair',
                        style: TextStyle(color: LasColors.buttonColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 40),
                height: 180,
                child: Stack(alignment: Alignment.center, children: <Widget>[
                  Image.asset(
                    'assets/images/Vector1.png',
                    height: 175,
                  ),
                  const ImageProfile(),
                ]),
              ),
              Container(
                padding: const EdgeInsets.only(top: 15),
                child: Center(
                  child: BlocBuilder<HomePageCubit, HomePageState>(
                    builder: (context, state) {
                      if (state is LoadingState) {
                        return const Text(
                          'carregando...',
                          style: LasTextStyle.txtTitleProfile,
                        );
                      } else if (state is SuccessState) {
                        String fullName = state.user.fullName;
                        return Text(
                          'Olá, ${fullName.split(' ').first}',
                          style: LasTextStyle.txtTitleProfile,
                        );
                      } else if (state is ErrorState) {
                        return const Text(
                          'erro',
                          style: LasTextStyle.txtTitleProfile,
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
