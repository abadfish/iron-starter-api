class API::CommentsController < ApplicationController
    before_action :set_campaign 
    before_action :set_campaign_comment, only: [:show, :update, :destroy]

    # GET /api/campaigns/:campaign_id/comments 
    def index 
        json_response(@campaign.comments)
    end

    # GET /api/campaigns/:campaign_id/comments/:id 
    def show 
        json_response(@comment) 
    end

    private 

        def set_campaign
            @campaign = Campaign.find(params[:campaign_id])
        end 

        def set_campaign_comment
            @comment = @campaign.comments.find_by!(id: params[:id]) if @campaign
        end
end
