import 'package:coding_challenge/core/dashboard/models/tax/tax_residence.dart';
import 'package:coding_challenge/core/utilities/const/colors.dart';
import 'package:coding_challenge/core/utilities/const/countries.dart';
import 'package:coding_challenge/core/utilities/utils/item_dropdown.dart';
import 'package:coding_challenge/core/utilities/utils/text_style.dart';
import 'package:coding_challenge/core/utilities/widgets/custom_flush_bar_widget.dart';
import 'package:coding_challenge/core/utilities/widgets/custom_text_filed_widget.dart';
import 'package:coding_challenge/features/dashboard/state/dashboard_state_view.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class TaxDataIteam extends ConsumerStatefulWidget {
  const TaxDataIteam({
    Key? key,
    required this.isItPrimaryTaxResidenceIteam,
    required this.taxResidence,
  }) : super(key: key);

  final bool isItPrimaryTaxResidenceIteam;
  final TaxResidence taxResidence;

  @override
  ConsumerState<TaxDataIteam> createState() => _TaxDataIteamState();
}

class _TaxDataIteamState extends ConsumerState<TaxDataIteam> {
  final taxIdEditTextController = TextEditingController();
  final taxIdFocusNode = FocusNode();

  List<ItemDropDown> convertToItemDropDown(List<Map<String, dynamic>> list) {
    return list
        .map(
          (item) => ItemDropDown(
            item['code'] as String, //key
            item['label'] as String, //value
            item['label'] as String, //text
          ),
        )
        .toList();
  }

  @override
  void initState() {
    taxIdEditTextController.text = widget.taxResidence.id ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          (widget.isItPrimaryTaxResidenceIteam)
              ? 'WHICH COUNTRY SERVES AS YOUR PRIMARY TAX RESIDENCE*'
              : 'DO YOU HAVE OTHER TAX RESIDENCE?*',
          style: tsBodyStyle.copyWith(
            fontSize: 12,
            color: cBlackColor.withOpacity(.7),
          ),
          textAlign: TextAlign.left,
        ),
        const SizedBox(
          height: 12,
        ),
        DropdownSearch<ItemDropDown>(
          popupProps: const PopupProps.menu(
            showSearchBox: true,
          ),
          selectedItem:
              convertToItemDropDown(CountriesConstants.nationality).firstWhere(
            (element) => element.key == widget.taxResidence.country,
          ),
          itemAsString: (itemDropDown) => itemDropDown.value,
          items: convertToItemDropDown(CountriesConstants.nationality),
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 20,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(.7),
                  width: 2.0,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(.7),
                  width: 2.0,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(.7),
                  width: 2.0,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              hintText: 'Choose Country',
              hintStyle: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          onChanged: (country) {
            if (country!.key != widget.taxResidence.country) {
              if (widget.isItPrimaryTaxResidenceIteam) {
                ref
                    .read(dashboardScreenViewStateProvider.notifier)
                    .updatePrimaryTax(
                      TaxResidence(
                        country: country.key,
                        id: taxIdEditTextController.text,
                      ),
                    );
              } else {
                ref
                    .read(dashboardScreenViewStateProvider.notifier)
                    .updateOtherTax(
                      widget.taxResidence,
                      TaxResidence(
                        country: country.key,
                        id: taxIdEditTextController.text,
                      ),
                    );
              }
            } else {
              FlushbarHelper.createErrorFlushbar(
                context: context,
                message: 'Please choose a new country!',
              ).show(context);
            }
          },
        ),
        const SizedBox(
          height: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'TAX IDENTIFICATION NUMBER*',
              style: tsBodyStyle.copyWith(
                fontSize: 12,
                color: cBlackColor.withOpacity(.7),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            taxNumberTextField(),
          ],
        ),
        if (!widget.isItPrimaryTaxResidenceIteam)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ZoomTapAnimation(
              onTap: () {
                ref
                    .read(dashboardScreenViewStateProvider.notifier)
                    .removeOtherTax(widget.taxResidence);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(
                    Icons.remove,
                    color: cRedColor,
                    size: 22,
                  ),
                  Text(
                    'REMOVE',
                    style: tsBodyStyle.copyWith(
                      color: cRedColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        SizedBox(
          height: (widget.isItPrimaryTaxResidenceIteam) ? 42 : 8,
        ),
      ],
    );
  }

  CustomTextField taxNumberTextField() {
    return CustomTextField(
      controller: taxIdEditTextController,
      focusNode: taxIdFocusNode,
      hintText: 'Tax ID or N/A',
      contentPadding: 14,
      borderColor: cBlackColor.withOpacity(.7),
      hintTextStyle: tsSubtitleStyle.copyWith(color: cGrayColor),
      style: tsSubtitleStyle.copyWith(color: cPrimeGreenColor),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onChanged: (newId) {
        if (widget.isItPrimaryTaxResidenceIteam) {
          ref.read(dashboardScreenViewStateProvider.notifier).updatePrimaryTax(
                TaxResidence(
                  country: widget.taxResidence.country,
                  id: newId,
                ),
              );
        } else {
          ref.read(dashboardScreenViewStateProvider.notifier).updateOtherTax(
                widget.taxResidence,
                TaxResidence(
                  country: widget.taxResidence.country,
                  id: newId,
                ),
              );
        }
      },
    );
  }
}
