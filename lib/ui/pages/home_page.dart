import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_fest/model/party.dart';
import 'package:my_fest/router.dart';
import 'package:my_fest/ui/controller/home_page/home_bloc.dart';
import 'package:my_fest/ui/widgets/action_button.dart';
import 'package:my_fest/ui/widgets/menu_drawer.dart';
import 'package:my_fest/ui/widgets/party_tile.dart';
import 'package:my_fest/ui/widgets/simple_appbar.dart';
import 'package:my_fest/utils/result.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: Scaffold(
        drawer: const MenuDrawer(),
        floatingActionButton: ActionButton(
          onPressed: () {
            context.pushNamed(Routes.FormParty.name);
          },
          content: "Nova Festa",
        ),
        appBar: SimpleAppbar(title: 'Festas'),
        body: BlocBuilder<HomeCubit, Result<List<Party>>>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.error != null) {
              return Center(child: Text("Erro: ${state.error}"));
            }

            if (state.content?.isEmpty ?? true) {
              return const Center(child: Text("Nenhuma festa cadastrada."));
            }

            final parties = state.content!;
            return ListView.builder(
              itemCount: parties.length,
              itemBuilder: (context, index) {
                final party = parties[index];
                return PartyTile(
                  party: party,
                  onPressed: () {},
                );
              },
            );
          },
        ),
      ),
    );
  }
}
