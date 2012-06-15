module PlayersHelper

  def ranking(player)
    content_tag(:div, player.ranking, :class => 'label label-important ranking')
  end

  def primary_action_button_for(player)
    if current_player == player
      link_to edit_player_path(player), :class => 'btn btn-large' do
        content_tag(:i, '', :class => 'icon-user') +\
          I18n.t('player.edit_profile')
      end
    elsif current_player and !current_player.in_progress_games(player).empty?
      link_to complete_game_path(current_player.in_progress_games(player).first), :class => 'btn btn-large' do
        content_tag(:i, '', :class => 'icon-plus-sign') +\
          I18n.t('player.complete_challenge')
      end
    elsif current_player
      challenge_link_options = {
        :method => :post,
        :remote => true,
        :'data-loading-text' => I18n.t('player.challenge_loading'),
        :class => 'btn btn-large btn-with-loading challenge'
      }

      link_to games_path(:game => {:challenged_id => player.id}), challenge_link_options do
        content_tag(:i, '', :class => 'icon-screenshot') +\
          I18n.t('player.challenge')
      end
    end
  end
end