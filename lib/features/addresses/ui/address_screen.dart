import '../../../core/base_widget/custom_app_bar.dart';
import '../../../core/base_widget/loading_indictor.dart';
import '../../../core/helper/spacing.dart';
import '../logic/addresses_cubit.dart';
import 'widgets/add_address_button.dart';
import 'widgets/address_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressesCubit, AddressesState>(
      builder: (context, state) {
        var cubit = AddressesCubit.get(context);
        return Scaffold(
          appBar: const CustomAppBar(
            title: "Address",
            isBack: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                verticleSpace(10),
                const AddAddressButtonWidget(),
                verticleSpace(10),
                cubit.getAddresseModel == null
                    ? LoadingIndictor()
                    : ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => AddressWidget(
                          addresseItem: cubit
                              .getAddresseModel!.data!.addresseItem![index],
                        ),
                        separatorBuilder: (context, index) => verticleSpace(5),
                        itemCount:
                            cubit.getAddresseModel!.data!.addresseItem!.length,
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
