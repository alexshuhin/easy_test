# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  navigation.selected_class = 'active'
  navigation.items do |primary|
    primary.item :home, fa_icon('home'),
      root_path,
      highlights_on: %r{^/$}

    primary.item :my_posts, fa_icon('book', text: 'Мои посты'),
      my_posts_path,
      highlights_on: %r{^/posts/my},
      if: -> { current_user.present? }

    primary.item :signup, fa_icon('user-plus', text: 'Зарегистрироваться'),
      new_user_registration_path,
      highlights_on: %r{^/users/sign_up},
      if: -> { current_user.blank? }

    primary.item :signin, fa_icon('sign-in', text: 'Войти'),
      new_user_session_path,
      highlights_on: %r{^/users/sign_in},
      if: -> { current_user.blank? }

    primary.item :signout, fa_icon('sign-out', text: 'Выйти'),
      destroy_user_session_path,
      method: :delete,
      if: -> { current_user.present? }

    primary.dom_attributes = { id: 'menu-id',
                               class: 'nav navbar-nav navbar-right' }
  end
end
