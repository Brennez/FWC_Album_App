import 'package:flutter/material.dart';
import 'package:flutter_awesome_select/flutter_awesome_select.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';

import '../presenter/my_stickers_presenter.dart';

class StickerGroupFilter extends StatefulWidget {
  //
  final Map<String, String> countries;

  const StickerGroupFilter({
    Key? key,
    required this.countries,
  }) : super(key: key);

  @override
  State<StickerGroupFilter> createState() => _StickerGroupFilterState();
}

class _StickerGroupFilterState extends State<StickerGroupFilter> {
  List<String>? selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SmartSelect<String>.multiple(
        title: 'Filtro',
        tileBuilder: (context, state) {
          return InkWell(
            onTap: () => state.showModal(),
            child: _stickerGroupTile(
                clearCallback: () {
                  setState(() {
                    selected = null;
                    context.get<MyStickersPresenter>().countryFilter(selected);
                  });
                },
                label: state.selected.title?.join(', ') ?? 'filtro'),
          );
        },
        selectedValue: selected ?? [],
        onChange: (selectedValue) {
          setState(() {
            selected = selectedValue.value;
          });
          context.get<MyStickersPresenter>().countryFilter(selected);
        },
        choiceItems: S2Choice.listFrom(
          source: widget.countries.entries
              .map((e) => {'value': e.key, 'title': e.value})
              .toList(),
          value: ((index, item) => item['value'] ?? ''),
          title: (((index, item) => item['title'] ?? '')),
        ),
        choiceType: S2ChoiceType.switches,
        modalType: S2ModalType.bottomSheet,
        choiceGrouped: true,
        modalFilter: false,
        placeholder: '',
      ),
    );
  }
}

class _stickerGroupTile extends StatelessWidget {
  final String label;
  final VoidCallback clearCallback;
  const _stickerGroupTile({
    Key? key,
    required this.label,
    required this.clearCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0XFFF0F0F0),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            const Icon(Icons.filter_list),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Text(
                label,
                style: context.textStyles.textSecondaryFontRegular.copyWith(
                  fontSize: 11,
                ),
              ),
            ),
            InkWell(
              child: IconButton(
                onPressed: clearCallback,
                icon: const Icon(Icons.clear),
              ),
            )
          ],
        ),
      ),
    );
  }
}
