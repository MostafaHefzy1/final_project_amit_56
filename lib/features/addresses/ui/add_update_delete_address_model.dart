import '../../../core/base_widget/custom_app_bar.dart';
import '../../../core/base_widget/custom_button.dart';
import '../../../core/base_widget/custom_text_form_filed.dart';
import '../../../core/helper/spacing.dart';
import '../data/models/get_addresse_model.dart';
import '../logic/addresses_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddUpdateDeleteAddressScreen extends StatelessWidget {
  final AddresseItem? addresseItem;

  const AddUpdateDeleteAddressScreen({super.key, this.addresseItem});
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<AddressesCubit, AddressesState>(
      builder: (context, state) {
        AddressesCubit.get(context).determinePosition();
        var cubit = AddressesCubit.get(context);
        return Scaffold(
          appBar: const CustomAppBar(
            title: "Add Address",
            isBack: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CustomTextFormFiled(
                    prefixIcon: Icons.person,
                    hintText: "Name",
                    validator: () {},
                    controller: cubit.nameController),
                verticleSpace(5),
                CustomTextFormFiled(
                    prefixIcon: Icons.location_city,
                    hintText: "city",
                    validator: () {},
                    controller: cubit.cityController),
                verticleSpace(5),
                CustomTextFormFiled(
                    prefixIcon: Icons.location_city,
                    hintText: "region",
                    validator: () {},
                    controller: cubit.regionController),
                verticleSpace(5),
                CustomTextFormFiled(
                    prefixIcon: Icons.description,
                    hintText: "details",
                    validator: () {},
                    controller: cubit.detailsnameController),
                verticleSpace(5),
                // CustomTextFormFiled(
                //     prefixIcon: Icons.pin_drop_outlined,
                //     hintText: "latitude",
                //     validator: () {},
                //     controller: cubit.latitudeController),
                // verticleSpace(5),
                // CustomTextFormFiled(
                //     prefixIcon: Icons.pin_drop_outlined,
                //     hintText: "longitude",
                //     validator: () {},
                //     controller: cubit.longitudeController),
                // verticleSpace(5),
                CustomTextFormFiled(
                    prefixIcon: Icons.notes,
                    hintText: "Notes",
                    validator: () {},
                    controller: cubit.notesController),
                verticleSpace(30),
              ],
            ),
          ),
          bottomNavigationBar: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: addresseItem == null
                  ? CustomButton(
                      loading: state is AddAddressesLoadingState,
                      text: "Add Addresss",
                      function: () {
                        cubit.addAddresses(context);
                      })
                  : Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                              loading: state is UpdateAddressesLoadingState,
                              text: "Update Addresss",
                              function: () {
                                cubit.updateAddresses(addresseItem!.id!, context);
                              }),
                        ),
                        horizontalSpace(8),
                        Expanded(
                          child: CustomButton(
                              loading: state is DeleteAddressesLoadingState,
                              text: "Delete Address",
                              colorButton: Colors.red,
                              function: () {
                                cubit.deleteAddresses(addresseItem!.id!, context);
                              }),
                        )
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }
}
