import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utils/conditional_builder.dart';

class SelectDialogDataModel {
  final int id;
  final String name;

  SelectDialogDataModel(this.id, this.name);
}

class SelectDialogCubit extends Cubit<SelectDialogStates> {
  List<SelectDialogDataModel>? filteredList;
  List<SelectDialogDataModel> list = [];

  SelectDialogCubit() : super(InitialState());

  static SelectDialogCubit get(BuildContext context) =>
      BlocProvider.of(context);

  SelectDialogStates get initialState => InitialState();

  Future init(initList) async {
    filteredList = initList;
    list.addAll(filteredList!);
    emit(ChangeState());
  }

  Future filter(val) async {
    List<SelectDialogDataModel> newDataModels = [];
    if (val.length > 0) {
      for (int i = 0; i < list.length; i++) {
        if (list[i].name.contains(val)) {
          newDataModels.add(list[i]);
          debugPrint(list[i].toString());
        }
      }
    } else {
      for (int i = 0; i < list.length; i++) {
        newDataModels.add(list[i]);
      }
    }
    filteredList!.clear();
    filteredList!.addAll(newDataModels);
    emit(ChangeState());
  }
}

@immutable
abstract class SelectDialogStates {
  const SelectDialogStates();
}

class InitialState extends SelectDialogStates {}

class ChangeState extends SelectDialogStates {}

class SelectAlertDialog extends StatelessWidget {
  const SelectAlertDialog({
    Key? key,
    this.isShowSearch,
    this.title,
    this.emptyListTitle,
    this.list,
    this.itemClickCallBack,
  }) : super(key: key);

  final bool? isShowSearch;
  final String? title;
  final String? emptyListTitle;
  final List<SelectDialogDataModel>? list;
  final Function? itemClickCallBack;
  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => SelectDialogCubit()..init(list),
      child: BlocBuilder<SelectDialogCubit, SelectDialogStates>(
        builder: (BuildContext context, SelectDialogStates state) {
          var _filteredList = SelectDialogCubit.get(context).filteredList;

          if (isShowSearch!) {
            searchController.addListener(() {
              SelectDialogCubit.get(context)
                  .filter(searchController.text.toString());
            });
          }
          return ConditionalBuilder(
            condition: state is! InitialState,
            builder: (context) => Dialog(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(title ?? '',
                          style: const TextStyle(fontSize: 22),
                          textAlign: TextAlign.center),
                      const SizedBox(height: 8),
                      const Divider(),
                      ConditionalBuilder(
                        condition: isShowSearch!,
                        builder: (context) => Padding(
                          padding: const EdgeInsets.only(
                            bottom: 8,
                          ),
                          child: TextFormField(
                            controller: searchController,
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                              filled: false,
                              label: Center(
                                child: Text(
                                  'بحث',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      ConditionalBuilder(
                        condition: _filteredList!.isNotEmpty,
                        builder: (_) => Flexible(
                          child: SizedBox(
                            height: 240,
                            child: ListView.separated(
                              itemCount: _filteredList.length,
                              separatorBuilder: (context, index) => const Divider(
                                color: Colors.white,
                                height: 4,
                              ),
                              itemBuilder: (context, index) => Container(
                                color: Colors.grey.shade50,
                                child: ListTile(
                                  onTap: () => itemClickCallBack!(
                                      _filteredList[index].id,
                                      _filteredList[index].name),
                                  title: Text(
                                    _filteredList[index].name,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        fallback: (_) => SizedBox(
                          height: 120,
                          child: Center(
                            child: Text(
                              emptyListTitle ??
                                  'لا يوجد لديك خيارات من هذا النوع',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
