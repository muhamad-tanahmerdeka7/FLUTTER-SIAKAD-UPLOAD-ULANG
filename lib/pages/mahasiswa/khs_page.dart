import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/khs/khs_bloc.dart';
import '../../common/components/custom_scaffold.dart';
import '../../common/components/row_text.dart';
import '../../common/constants/colors.dart';

class KhsPage extends StatefulWidget {
  const KhsPage({super.key});

  @override
  State<KhsPage> createState() => _KhsPageState();
}

class _KhsPageState extends State<KhsPage> {
  @override
  void initState() {
    super.initState();
    context.read<KhsBloc>().add(const KhsEvent.getKhs());
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const Text(
            "KHS Mahasiswa",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "14 of 64 results",
                style: TextStyle(
                  color: ColorName.grey,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.filter_list),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            leading: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(50.0)),
              child: Image.network(
                'https://avatars.githubusercontent.com/u/141952650?v=4',
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
            title: const Text(
              "Muhamad S.Kom",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            subtitle: const Text(
              "Mahasiswa",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          const Divider(),
          const SizedBox(height: 16.0),
          const RowText(
            label: 'Mata Kuliah :',
            value: 'Nilai :',
            labelColor: ColorName.primary,
            valueColor: ColorName.primary,
          ),
          const SizedBox(height: 14.0),
          BlocBuilder<KhsBloc, KhsState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return const SizedBox();
                },
                loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                loaded: (data) {
                  return Column(
                    children: [
                      for (int index = 0; index < data.length; index++)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: RowText(
                            label: data[index].subject.title,
                            value: data[index].grade.toString(),
                          ),
                        ),
                      const SizedBox(height: 40.0),
                      const RowText(
                        label: 'IPK Semester :',
                        value: '3.18',
                        labelColor: ColorName.primary,
                        valueColor: ColorName.primary,
                      ),
                      const SizedBox(height: 40.0),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
