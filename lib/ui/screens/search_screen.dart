import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/bloc/weather_bloc.dart';

import '../navigation/main_navigation.dart';

import '../widgets/search_error_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _query = '';

  final _searchTextFieldController = TextEditingController();

  @override
  void dispose() {
    _searchTextFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    final deviceSize = MediaQuery.of(context).size;
    final themeData = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 24,
                  ),
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  hintText: 'Введите название города',
                  labelText: 'Поиск',
                  hintStyle: const TextStyle(
                    fontSize: 24,
                  ),
                  labelStyle: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
                style: themeData.textTheme.headline4,
                onChanged: (value) => setState(() => _query = value),
                controller: _searchTextFieldController,
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: deviceSize.height * 0.3,
              child: BlocConsumer<WeatherBloc, WeatherState>(
                listener: (context, state) {
                  if (state.weatherDetails != null) {
                    Navigator.of(context)
                        .pushReplacementNamed(RouteNames.weatherDetails);
                  }
                },
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state.errorCode.isNotEmpty) {
                    return SearchError(errorCode: state.errorCode);
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            ElevatedButton(
              onPressed: _query.trim() == ''
                  ? null
                  : () =>
                      weatherBloc.add(GetWeatherDetailsEvent(_query.trim())),
              child: const Text('Искать'),
            ),
          ],
        ),
      ),
    );
  }
}
