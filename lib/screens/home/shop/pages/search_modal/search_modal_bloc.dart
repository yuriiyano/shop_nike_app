import 'package:injectable/injectable.dart';
import 'package:stx_flutter_form_bloc/stx_flutter_form_bloc.dart';

@Injectable()
class SearchModalBloc extends FormBloc<String, String> {
  late final TextFieldBloc searchQuery;
  late final ListFieldBloc<String> autocomplete;

  SearchModalBloc() : super(customSubmit: false) {
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
      searchQuery.valueStream.listen((value) {
        final autocompleteToDisplay = autocomplete.initialValue
            .where(
              (data) =>
                  data.toUpperCase().contains((value ?? '').toUpperCase()),
            )
            .toList();
        autocomplete.changeValue(autocompleteToDisplay);
      }),
    );
  }
}
