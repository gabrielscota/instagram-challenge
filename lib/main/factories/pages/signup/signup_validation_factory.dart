import '../../../../presentation/protocols/protocols.dart';
import '../../../../validation/protocols/protocols.dart';
import '../../../builders/builders.dart';
import '../../../composites/composites.dart';

Validation makeSignupValidation() => ValidationComposite(
      validations: makeSignupValidations(),
    );

List<FieldValidation> makeSignupValidations() => [
      ...ValidationBuilder.field('email').required().email().build(),
      ...ValidationBuilder.field('password').required().min(6).build()
    ];
