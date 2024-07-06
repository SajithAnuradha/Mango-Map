import globals from 'globals';
import pluginJs from '@eslint/js';

export default [
  { files: ['**/*.js'], languageOptions: { sourceType: 'module' } },
  {
    languageOptions: {
      globals: { ...globals.browser, ...globals.node, ...globals.es2020 },
    },
  },
  pluginJs.configs.recommended,

  {
    rules: {
      'no-unused-vars': 'warn',
      'no-undef': 'warn',
      'no-unreachable': 'warn',
      'no-unsafe-negation': 'warn',
      'no-unused-expressions': 'warn',
      'no-useless-return': 'warn',
    },
  },
];
