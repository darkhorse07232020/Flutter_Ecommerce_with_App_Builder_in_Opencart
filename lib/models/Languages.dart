final Map<String, Map<String, String>> localizedValues = {
  'en-gb': {
    'home': 'Home',
    'contact_us': 'Contact Us',
    'languages': 'Language(s)',
    'currencies': 'Currency(s)',
    'log_in': 'Log in',
    'categories': 'Categories',
    'cart': 'Cart',
    'log_in_title': 'Welcome Back',
    'log_in_subtitle':
        'Sign in with your email and password  \nor continue with social media',
    'forgot_password': 'Forgot Password',
    'continue': 'Continue',
    'no_account': 'Don’t have an account? ',
    'sign_up': 'Sign Up',
    'add_to_cart': 'Add to Cart',
    'product_info': 'Product Info and Care',
    'related_products': 'RELATED PRODUCTS',
    'product': 'Product',
    'forgot_password_subtitle':
        'Please enter your email and we will send \nyou a link to return to your account',
    'login_success': 'Login Success',
    'back_to_home': 'Back to Home',
    'loading_data': 'Loading data...',
    'sort': 'Sort',
    'filter': 'Filter',
  },
  'zh-hk': {
    'home': 'Home',
    'contact_us': 'Contact Us',
    'languages': 'Language(s)',
    'currencies': 'Currency(s)',
    'log_in': 'Log in',
    'categories': 'Categories',
    'cart': 'Cart',
    'log_in_title': 'Welcome Back',
    'log_in_subtitle':
        'Sign in with your email and password  \nor continue with social media',
    'forgot_password': 'Forgot Password',
    'continue': 'Continue',
    'no_account': 'Don’t have an account? ',
    'sign_up': 'Sign Up',
    'add_to_cart': 'Add to Cart',
    'product_info': 'Product Info and Care',
    'related_products': 'RELATED PRODUCTS',
    'product': 'Product',
    'forgot_password_subtitle':
        'Please enter your email and we will send \nyou a link to return to your account',
    'login_success': 'Login Success',
    'back_to_home': 'Back to Home',
    'loading_data': 'Loading data...',
    'sort': 'Sort',
    'filter': 'Filter',
  },
};

String getWord(locale, key) {
  if (localizedValues[locale][key] == null) {
    if (localizedValues['en-gb'][key] == null) {
      return key;
    } else {
      return localizedValues['en-gb'][key];
    }
  } else {
    return localizedValues[locale][key];
  }
}
