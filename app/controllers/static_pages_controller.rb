class StaticPagesController < ApplicationController
  def home
    @top5_news = News.newest.limit Settings.homepage_article_num
    @top3_players = Player.alphabet.limit Settings.homepage_players_num
    @top5_matches = Match.latest.limit Settings.homepage_matches_num
  end
end
