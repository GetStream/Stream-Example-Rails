class FeedsController < ApplicationController
  before_action :create_enricher
  before_action :authenticate_user!

  def user
    feed = StreamRails.feed_manager.get_user_feed(current_user.id)
    results = feed.get()['results']
    @activities = @enricher.enrich_activities(results)
  end

  def flat
    feed = StreamRails.feed_manager.get_news_feeds(current_user.id)[:flat]
    results = feed.get()['results']
    @activities = @enricher.enrich_activities(results)
  end

  def aggregated
    feed = StreamRails.feed_manager.get_news_feeds(current_user.id)[:aggregated]
    results = feed.get()['results']
    @activities = @enricher.enrich_aggregated_activities(results)
  end

  def create_enricher
    @enricher = StreamRails::Enrich.new
  end

end
