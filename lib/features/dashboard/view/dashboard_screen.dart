import 'package:coding_challenge/core/dashboard/models/tax/tax_residence.dart';
import 'package:coding_challenge/core/utilities/const/colors.dart';
import 'package:coding_challenge/core/utilities/const/countries.dart';
import 'package:coding_challenge/core/utilities/utils/text_style.dart';
import 'package:coding_challenge/core/utilities/widgets/custom_flush_bar_widget.dart';
import 'package:coding_challenge/core/utilities/widgets/custom_slide_up_panel_widget.dart';
import 'package:coding_challenge/features/dashboard/state/dashboard_state_view.dart';
import 'package:coding_challenge/features/dashboard/view/tax_data_iteam_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  final panelController = PanelController();

  late Future<void> _getUserTaxDataFuture;

  @override
  void initState() {
    super.initState();
    _getUserTaxDataFuture =
        ref.read(dashboardScreenViewStateProvider.notifier).getUserTaxData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: FutureBuilder(
                future: _getUserTaxDataFuture,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: cPrimeGreenColor,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Error: ${snapshot.error}',
                        style: tsBodyStyle,
                      ),
                    );
                  } else {
                    // Show UI once data is loaded
                    return _buildContent();
                  }
                },
              ),
            ),
            slidingUpPanelUpdateTaxData(),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/CryingGirl.svg',
          height: 250,
        ),
        const SizedBox(height: 4),
        Text(
          'Uh-Oh!',
          style: tsTitleStyle.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'We need your tax data in order for your to access your account',
          style: tsSubtitleStyle,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        ZoomTapAnimation(
          onTap: () {
            panelController.open();
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 26),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.all(Radius.circular(32)),
              color: cPrimeGreenColor.withOpacity(.7),
            ),
            alignment: Alignment.center,
            child: Text(
              'UPDATE YOUR TAX DATA',
              style: tsSubtitleStyle.copyWith(color: cWhiteColor),
            ),
          ),
        ),
      ],
    );
  }

  Widget slidingUpPanelUpdateTaxData() {
    return SlidingUpPanel(
      controller: panelController,
      maxHeight: MediaQuery.of(context).size.height - 200,
      minHeight: 0,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      color: cWhiteColor,
      parallaxEnabled: false,
      panelSnapping: false,
      backdropEnabled: true,
      isDraggable: false,
      panelBuilder: (controller) {
        // Retrieve tax data from Riverpod provider
        final userTaxData =
            ref.watch(dashboardScreenViewStateProvider).userTaxData;
        final userConfirm =
            ref.watch(dashboardScreenViewStateProvider).userConfirm;
        final updateSuccessfully =
            ref.watch(dashboardScreenViewStateProvider).updateSuccessfully;
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 26),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: Text(
                    'Declaration of financial information',
                    style: tsSubtitleStyle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (userTaxData?.primaryTaxResidence != null)
                  TaxDataIteam(
                    isItPrimaryTaxResidenceIteam: true,
                    taxResidence: userTaxData!.primaryTaxResidence,
                  ),
                if (userTaxData?.secondaryTaxResidence != null)
                  Column(
                    children: userTaxData!.secondaryTaxResidence
                        .map((taxResidence) => TaxDataIteam(
                              isItPrimaryTaxResidenceIteam: false,
                              taxResidence: taxResidence,
                            ))
                        .toList(),
                  ),
                ZoomTapAnimation(
                  onTap: () {
                    ref
                        .read(dashboardScreenViewStateProvider.notifier)
                        .addOtherTax(
                          TaxResidence(
                            country: CountriesConstants
                                .nationality.first['code']
                                .toString(),
                            id: '',
                          ),
                        );
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.add,
                        color: cPrimeGreenColor,
                        size: 22,
                      ),
                      Text(
                        'ADD ANOTHER',
                        style: tsBodyStyle.copyWith(
                          color: cPrimeGreenColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    Checkbox(
                      value: userConfirm,
                      onChanged: (newValue) {
                        ref
                            .read(dashboardScreenViewStateProvider.notifier)
                            .userConfirm(newValue ?? false);
                      },
                    ),
                    const SizedBox(
                      width: 250,
                      child: Text(
                        'I confirm above tax residency and US self-declaration is true and accurate.',
                        style: tsBodyStyle,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 42),
                ZoomTapAnimation(
                  onTap: () {
                    if (userConfirm) {
                      ref
                          .read(dashboardScreenViewStateProvider.notifier)
                          .updateUserTaxData()
                          .then((_) {
                        panelController.close();
                        if (updateSuccessfully == false) {
                          FlushbarHelper.createErrorFlushbar(
                            context: context,
                            message: 'Something went wrong! Please try again.',
                          ).show(context);
                        }
                      });
                    } else {
                      FlushbarHelper.createInfoFlushbar(
                        context: context,
                        message:
                            'Please confirm that the above data is correct!',
                      )!
                          .show(context);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    width: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(32),
                      ),
                      color: cPrimeGreenColor.withOpacity(.7),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'SAVE',
                      style: tsSubtitleStyle.copyWith(color: cWhiteColor),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        );
      },
    );
  }
}
