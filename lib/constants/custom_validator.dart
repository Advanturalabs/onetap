class CustomValidator {
  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email address is required';
    }
    final emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailRegex.hasMatch(value)) {
      return 'Invalid email address';
    }
    return null;
  }

  static String? password(String? value) {
    if (value!.isEmpty) {
      return 'Incorrect password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  static String? newPassword(String? value) {
    if (value!.isEmpty) {
      return 'Enter new password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  static String? oldPassword(String? value) {
    if (value!.isEmpty) {
      return 'Enter old password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  static String? confirmPassword(String? value, String oldPassword) {
    if (value!.isEmpty) {
      return 'Confirm password is required';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    } else if (value != oldPassword) {
      return 'Confirm password is not matched';
    }
    return null;
  }

  static String? name(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter name';
    }

    // Allow only letters and spaces
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'Name must contain only letters';
    }

    return null;
  }

  static String? dateOfBirth(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter date of birth';
    }

    if (!RegExp(r'^\d{2}[/-]\d{2}[/-]\d{4}$').hasMatch(value)) {
      return 'Use DD/MM/YYYY format';
    }

    final parts = value.split(RegExp(r'[/-]'));
    final day = int.parse(parts[0]);
    final month = int.parse(parts[1]);
    final year = int.parse(parts[2]);

    try {
      final date = DateTime(year, month, day);
      if (date.isAfter(DateTime.now())) {
        return 'Date cannot be in future';
      }
    } catch (e) {
      return 'Invalid date';
    }

    return null;
  }

  // static String? name(String? value) {
  //   if (value!.isEmpty) {
  //     return 'Enter name';
  //   }
  //   return null;
  // }

  static String? firstName(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your First Name';
    }
    return null;
  }

  static String? isEmptyFirstName(String? value) {
    if (value!.isEmpty) {
      return "First name is required";
    }
    if (RegExp(r'[0-9]').hasMatch(value)) {
      return "First name cannot contain numbers";
    }
    return null;
  }

  static String? lastName(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your Last Name';
    }
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    } else if (value.length < 10) {
      return 'Please enter valid phone number';
    }
    return null;
  }

  static String? otp(String? value) {
    if (value!.isEmpty) {
      return 'Please enter otp';
    }
    if (value.length < 4) {
      return 'Please enter valid otp';
    }
    return null;
  }

  static String? otpRequired(String? value, int otpLength) {
    if (value == null || value.isEmpty) {
      return 'Enter your OTP';
    }
    if (value.length < otpLength) {
      return 'Please enter valid OTP';
    }
    return null;
  }

  static String? isEmptySubscriptionCode(String? value) {
    if (value!.isEmpty) {
      return 'Please enter subscription code';
    }
    return null;
  }

  static String? dateEvent(String? value) {
    if (value!.isEmpty) {
      return 'Please select date';
    }
    return null;
  }

  static String? startDateAndTime(String? value) {
    if (value == null || value.isEmpty) {
      return "Please select a start date";
    }
    return null;
  }

  static String? dateValidtor(String? value) {
    if (value == null || value.isEmpty) {
      return "Please select date";
    }
    return null;
  }

  static String? endDateAndTime(String? value) {
    if (value == null || value.isEmpty) {
      return "Please select a end date";
    }
    return null;
  }

  // ============================================
  // VEHICLE VALIDATORS
  // ============================================

  static String? carMake(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Car make is required';
    }
    if (value.trim().length < 2) {
      return 'Car make must be at least 2 characters';
    }
    return null;
  }

  static String? carModel(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Car model is required';
    }
    if (value.trim().length < 2) {
      return 'Car model must be at least 2 characters';
    }
    return null;
  }

  static String? carPlateNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Car plate number is required';
    }
    // Basic plate number validation (alphanumeric and hyphens)
    final plateRegex = RegExp(r'^[A-Z0-9-]+$', caseSensitive: false);
    if (!plateRegex.hasMatch(value.trim())) {
      return 'Please enter a valid plate number';
    }
    if (value.trim().length < 3) {
      return 'Plate number must be at least 3 characters';
    }
    return null;
  }

  static String? carColor(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Car color is required';
    }
    // Check if color contains only letters and spaces
    final colorRegex = RegExp(r'^[a-zA-Z\s]+$');
    if (!colorRegex.hasMatch(value.trim())) {
      return 'Please enter a valid color name';
    }
    if (value.trim().length < 3) {
      return 'Color name must be at least 3 characters';
    }
    return null;
  }

  // ============================================
  // PAYMENT CARD VALIDATORS
  // ============================================

  static String? cardNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Card number is required';
    }

    // Remove spaces for validation
    String cleanValue = value.replaceAll(' ', '');

    // Check if contains only digits
    if (!RegExp(r'^[0-9]+$').hasMatch(cleanValue)) {
      return 'Card number must contain only digits';
    }

    // Check length (most cards are 16 digits, some are 13-19)
    if (cleanValue.length < 13 || cleanValue.length > 19) {
      return 'Card number must be between 13-19 digits';
    }

    // Luhn algorithm validation
    if (!_isValidLuhn(cleanValue)) {
      return 'Invalid card number';
    }

    return null;
  }

  static String? cardExpiryDate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Expiry date is required';
    }

    // Remove slash for validation
    String cleanValue = value.replaceAll('/', '');

    // Check if contains only digits
    if (!RegExp(r'^[0-9]+$').hasMatch(cleanValue)) {
      return 'Expiry date must contain only digits';
    }

    // Check if in MM/YY format
    if (cleanValue.length != 4) {
      return 'Expiry date must be in MM/YY format';
    }

    int month = int.parse(cleanValue.substring(0, 2));
    int year = int.parse(cleanValue.substring(2, 4));

    // Validate month
    if (month < 1 || month > 12) {
      return 'Invalid month';
    }

    // Validate year (check if card is expired)
    int currentYear = DateTime.now().year % 100; // Get last 2 digits of year
    int currentMonth = DateTime.now().month;

    if (year < currentYear || (year == currentYear && month < currentMonth)) {
      return 'Card has expired';
    }

    return null;
  }

  static String? cardCVC(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'CVC is required';
    }

    // Check if contains only digits
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'CVC must contain only digits';
    }

    // Check length (most cards have 3 digits, Amex has 4)
    if (value.length < 3 || value.length > 4) {
      return 'CVC must be 3 or 4 digits';
    }

    return null;
  }

  static String? cardHolderName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Card holder name is required';
    }

    // Check if contains only letters and spaces
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'Name must contain only letters';
    }

    if (value.trim().length < 3) {
      return 'Name must be at least 3 characters';
    }

    return null;
  }

  // ============================================
  // HELPER METHODS
  // ============================================

  // Luhn algorithm for credit card validation
  static bool _isValidLuhn(String cardNumber) {
    int sum = 0;
    bool alternate = false;

    for (int i = cardNumber.length - 1; i >= 0; i--) {
      int digit = int.parse(cardNumber[i]);

      if (alternate) {
        digit *= 2;
        if (digit > 9) {
          digit -= 9;
        }
      }

      sum += digit;
      alternate = !alternate;
    }

    return sum % 10 == 0;
  }
}

// class CustomValidator {
//
//   static String? email(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'Email address is required';
//     }
//     final emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
//     if (!emailRegex.hasMatch(value)) {
//       return 'Please enter a valid email';
//     }
//     return null;
//   }
//   static String? password(String? value) {
//     if (value!.isEmpty) {
//       return 'Enter password';
//     } else if (value.length < 8) {
//       return 'Password must be at least 8 characters';
//     }
//     return null;
//   }
//   static String? newPassword(String? value) {
//     if (value!.isEmpty) {
//       return 'Enter new password';
//     } else if (value.length < 8) {
//       return 'Password must be at least 8 characters';
//     }
//
//     return null;
//   }
//   static String? oldPassword(String? value) {
//     if (value!.isEmpty) {
//       return 'Enter old password';
//     } else if (value.length < 8) {
//       return 'Password must be at least 8 characters';
//     }
//     return null;
//   }
//   static String? confirmPassword(String? value, String oldPassword) {
//     if (value!.isEmpty) {
//       return null;
//     }
//     else if (value.length < 8) {
//       return ' Password must be at least 8 characters';
//     }
//     else if (value != oldPassword) {
//       return ' Confirm password is not matched';
//     }
//     return null;
//   }
//   static String? name(String? value) {
//     if (value!.isEmpty) {
//       return ' Enter name';
//     }
//     return null;
//   }
//   static String? firstName(String? value) {
//     if (value!.isEmpty) {
//       return 'Please enter your First Name';
//     }
//     return null;
//   }
//   static String? isEmptyFirstName(String? value) {
//     // Check if the value is empty
//     if (value!.isEmpty) {
//       return "First name is required";
//     }
//
//     // Check if the value contains any digits
//     if (RegExp(r'[0-9]').hasMatch(value)) {
//       return "First name cannot contain numbers"; // Add this message in Languages
//     }
//
//     return null;
//   }
//   static String? lastName(String? value) {
//     if (value!.isEmpty) {
//       return 'Please enter your Last Name';
//     }
//     return null;
//   }
//   static String? phone(String? value) {
//     if (value == null || value.isEmpty) {
//       return ' Phone number is required';
//     } else if (value.length < 10) {
//       return ' Please enter valid phone number';
//     }
//     return null;
//   }
//   static String? otp(String? value) {
//     if (value!.isEmpty) {
//       return 'Please enter otp';
//     }
//     if (value.length < 4) {
//       return 'Please enter valid otp';
//     }
//     return null;
//   }
//   static String? otpRequired(String? value, int otpLength) {
//     if (value == null || value.isEmpty) {
//       return 'Enter your OTP';
//     }
//     if (value.length < otpLength) {
//       return 'Please enter valid OTP';
//     }
//     return null;
//   }
//
//   static String? isEmptySubscriptionCode(String? value) {
//     if (value!.isEmpty) {
//       return 'Please enter subscription code';
//     }
//     return null;
//   }
//   static String? dateEvent(String? value) {
//     if (value!.isEmpty) {
//       return ' Please select date ';
//     }
//     return null;
//   }
//   static String? startDateAndTime(String? value) {
//     if (value == null || value.isEmpty) {
//       return "Please select a start date";
//     }
//     return null;
//   }
//   static String? dateValidtor(String? value) {
//     if (value == null || value.isEmpty) {
//       return "Please select date";
//     }
//     return null;
//   }
//   static String? endDateAndTime(String? value) {
//     if (value == null || value.isEmpty) {
//       return "Please select a end date";
//     }
//     return null;
//   }
//
// }