import 'package:injectable/injectable.dart';
import 'package:stx_flutter_form_bloc/stx_flutter_form_bloc.dart';

@Injectable()
class SearchModalBloc extends FormBloc<String, String> {
  late final TextFieldBloc searchQuery;
  late final ListFieldBloc<String> autocomplete;

  SearchModalBloc() : super() {
    searchQuery = TextFieldBloc(
      required: true,
    );

    autocomplete = ListFieldBloc(
      initialValue: [
        'Slim',
        'Solid',
        'Short',
        'Fit',
        'Gold',
        'Rose',
        'Gold',
        'Drive',
        'Gaming',
      ],
    );

    addFields([
      searchQuery,
      autocomplete,
    ]);

    addSubscription(
      searchQuery.valueStream.listen((query) {
        final searchedOptions = autocomplete.initialValue
            .where(
              (option) =>
                  option.toUpperCase().contains((query ?? '').toUpperCase()),
            )
            .toList();
        autocomplete.changeValue(searchedOptions);
      }),
    );
  }
}
