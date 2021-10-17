import Rails from '@rails/ujs';
import Turbolinks from 'turbolinks';
import * as ActiveStorage from '@rails/activestorage';
import '@/channels';
import '@/controllers/application';

import '@tabler/core/dist/css/tabler.min.css';
import '@/scss/application/index.scss';

Rails.start();
Turbolinks.start();
ActiveStorage.start();
require.context('@/images', true);

document.addEventListener('turbolinks:load', () => {
  import('@tabler/core/dist/js/tabler.min');
});
