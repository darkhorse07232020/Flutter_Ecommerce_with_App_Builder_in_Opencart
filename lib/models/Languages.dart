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
    'my_account': 'My Account',
  },
  'zh-hk': {
    'home': '主頁',
    'contact_us': '聯絡我們',
    'languages': '語言',
    'currencies': '貨幣',
    'log_in': '登入',
    'categories': '分類',
    'cart': '購物車',
    'log_in_title': '歡迎',
    'log_in_subtitle': '請使用電郵和密碼登入或使用社交媒體',
    'forgot_password': '忘記密碼',
    'continue': '繼續',
    'no_account': '沒有帳戶? ',
    'sign_up': '註冊',
    'add_to_cart': '加入購物車',
    'product_info': '商品資料',
    'related_products': '相關商品',
    'product': '商品',
    'forgot_password_subtitle': '請輸入電郵，我們將會發送一條鏈結給您',
    'login_success': '成功登入',
    'back_to_home': '返回主頁',
    'loading_data': '載入中...',
    'sort': '排序',
    'filter': '篩選',
    'my_account': '我的帳戶',
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
