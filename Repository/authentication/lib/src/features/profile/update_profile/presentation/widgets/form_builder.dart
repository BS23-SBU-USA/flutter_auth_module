part of '../pages/update_profile_page.dart';

class UpdateProfileFormBuilder extends ConsumerStatefulWidget {
  const UpdateProfileFormBuilder({super.key});

  @override
  ConsumerState<UpdateProfileFormBuilder> createState() {
    return _UpdateProfileFormBuilderState();
  }
}

class _UpdateProfileFormBuilderState
    extends ConsumerState<UpdateProfileFormBuilder> {
  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(updateProfileInfoProvider.notifier);

    return SingleChildScrollView(
      child: Form(
        key: notifier.formKey,
        child: Column(
          children: [
            InputFormField(
              onChanged: (value) {
                _capitalizeFirstLetter(notifier.firstNameController);
              },
              textEditingController: notifier.firstNameController,
              labelText: TextConstants.firstName,
              autocorrect: false,
            ),
            InputFormField(
              onChanged: (value) {
                _capitalizeFirstLetter(notifier.lastNameController);
              },
              textEditingController: notifier.lastNameController,
              labelText: TextConstants.lastName,
              autocorrect: false,
              keyboardType: TextInputType.name,
            ),
            InputFormField(
              textEditingController: notifier.onlyPhoneController,
              label: Text(
                TextConstants.phoneNumber,
                style: AppTypography.bold14(
                  color: UIColors.secondary,
                ),
              ),
              maxLength: 10,
              prefix: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CountryCodePicker(
                    initialSelection: notifier.countryCodeController.text,
                    countryFilter: const ['+880', 'US'],
                    onChanged: (country) {
                      notifier.countryCodeController.text = country.dialCode!;
                    },
                  ),
                  Container(
                    width: 1,
                    color: UIColors.secondary,
                    margin: const EdgeInsets.only(right: 16),
                  ),
                ],
              ),
              validator: InputValidators.phone,
              onChanged: (value) {
                ref
                    .watch(updateProfileValidationProvider.notifier)
                    .isAbleToUpdate(value);
              },
            ),
            const GenderDropdownFormField(),
            const BirthdayFormFieldBuilder(),
          ],
        ),
      ),
    );
  }

  void _capitalizeFirstLetter(TextEditingController controller) {
    final text = controller.text;
    final newText = text.replaceAllMapped(
      RegExp(r'\b\w'),
      (match) => match.group(0)!.toUpperCase(),
    );

    if (newText != text) {
      final newSelectionOffset = newText.length;
      controller.value = controller.value.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newSelectionOffset),
      );
    }
  }
}
