import 'package:coding_challenge/core/dashboard/models/tax/tax_residence.dart';
import 'package:coding_challenge/core/dashboard/models/tax/user_tax_data.dart';
import 'package:coding_challenge/core/dashboard/services/dashboard_services.dart';
import 'package:coding_challenge/core/utilities/dependency_injection/get_it_config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dashboard_state_view.g.dart';

class DashboardScreenViewModel {
  final bool isLoading;
  final bool userConfirm;
  final bool? updateSuccessfully;
  final UserTaxData? userTaxData;

  DashboardScreenViewModel({
    required this.isLoading,
    required this.userConfirm,
    this.updateSuccessfully,
    this.userTaxData,
  });

  DashboardScreenViewModel copyWith({
    bool? isLoading,
    bool? userConfirm,
    UserTaxData? userTaxData,
    bool? updateSuccessfully,
  }) {
    return DashboardScreenViewModel(
      isLoading: isLoading ?? this.isLoading,
      userTaxData: userTaxData ?? this.userTaxData,
      userConfirm: userConfirm ?? this.userConfirm,
      updateSuccessfully: updateSuccessfully ?? this.updateSuccessfully,
    );
  }
}

@riverpod
class DashboardScreenViewState extends _$DashboardScreenViewState {
  @override
  DashboardScreenViewModel build() {
    return DashboardScreenViewModel(
      isLoading: true,
      userConfirm: false,
    );
  }

  void updateState(DashboardScreenViewModel newState) {
    state = newState;
  }

  void userConfirm(bool userConfirm) {
    updateState(
      state.copyWith(
        userConfirm: userConfirm,
      ),
    );
  }

  void removeOtherTax(TaxResidence taxResidence) {
    List<TaxResidence> secondaryTaxResidenceList =
        List.from(state.userTaxData!.secondaryTaxResidence);
    secondaryTaxResidenceList.removeWhere((element) => element == taxResidence);
    updateState(
      state.copyWith(
        userTaxData: state.userTaxData!
            .copyWith(secondaryTaxResidence: secondaryTaxResidenceList),
      ),
    );
  }

  void updatePrimaryTax(
    TaxResidence newTaxResidence,
  ) {
    updateState(
      state.copyWith(
        userTaxData: state.userTaxData!.copyWith(
          primaryTaxResidence: newTaxResidence,
        ),
      ),
    );
  }

  void updateOtherTax(
    TaxResidence oldTaxResidence,
    TaxResidence newTaxResidence,
  ) {
    List<TaxResidence> secondaryTaxResidenceList =
        List.from(state.userTaxData!.secondaryTaxResidence);
    // Find the index of the old tax residence in the list
    int index = secondaryTaxResidenceList.indexOf(oldTaxResidence);
    // Check if the old tax residence exists in the list
    if (index != -1) {
      // Replace the old tax residence with the new one
      secondaryTaxResidenceList[index] = newTaxResidence;

      // Update the state with the updated list
      updateState(
        state.copyWith(
          userTaxData: state.userTaxData!.copyWith(
            secondaryTaxResidence: secondaryTaxResidenceList,
          ),
        ),
      );
    }
  }

  void addOtherTax(TaxResidence taxResidence) {
    List<TaxResidence> secondaryTaxResidenceList =
        List.from(state.userTaxData!.secondaryTaxResidence);
    if (secondaryTaxResidenceList.isEmpty) {
      // If the list is empty, create a new list with the new taxResidence
      secondaryTaxResidenceList = [taxResidence];
    } else {
      // Otherwise, add the taxResidence to the existing list
      secondaryTaxResidenceList.add(taxResidence);
    }
    updateState(
      state.copyWith(
        userTaxData: state.userTaxData!
            .copyWith(secondaryTaxResidence: secondaryTaxResidenceList),
      ),
    );
  }

  Future<void> updateUserTaxData() async {
    if (state.userTaxData != null) {
      await getIt<DashboardServices>()
          .updateUserTaxData(state.userTaxData!)
          .then((statusCode) {
        if (statusCode == 200) {
          //update data successfully
          updateState(
            state.copyWith(
              updateSuccessfully: true,
              isLoading: false,
            ),
          );
        } else {
          //error
          updateState(
            state.copyWith(
              updateSuccessfully: false,
              isLoading: false,
            ),
          );
        }
      });
    }
  }

  Future<void> getUserTaxData() async {
    await getIt<DashboardServices>().getUserTaxData().then((response) async {
      //TODO: more detailed error handling for getting tax data process
      if (response != null) {
        if (response.data != null && response.statusCode == 200) {
          final userTaxData = UserTaxData.fromJson(response.data);
          updateState(
            state.copyWith(
              userTaxData: userTaxData,
              isLoading: false,
            ),
          );
        } else {
          updateState(
            state.copyWith(
              isLoading: false,
            ),
          );
        }
      } else {
        updateState(
          state.copyWith(
            isLoading: false,
          ),
        );
      }
    });
  }
}
