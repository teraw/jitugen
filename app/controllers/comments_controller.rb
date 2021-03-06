class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @board = Board.find(params[:board_id])
    @comment = Comment.new(comment_params) #入力したコメントを入れる
    @comment.board = @board 
    @comment.ip = request.remote_ip
    
    #セッション情報にユニークIDと生成時刻を投入
session[:data] = SecureRandom.urlsafe_base64(8)
sessId = cookies[:_w_session] 

      p("成功")
      p(sessId)
      p(ActiveRecord::SessionStore::Session.find_by(session_id: sessId))

#session[:data] = SecureRandom.urlsafe_base64(8)

 
      #if params[:ip] == @comment.ip#IPが同じであれば実行される
        #if Time.zone.now > 1.day.ago#時間が24時間以上経っていれば
          #params[:digitid] = SecureRandom.urlsafe_base64(8)
        #else 
          #params[:digitid] = "だよだよ" #@comment.digitid
          
          #
        #end

     # end

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @board, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        #format.html { render :new }
        format.html { redirect_to @board, notice: '入力失敗しました。' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:board_id, :name, :content, :ip, :digitid)
    end
    
end
