class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  
  # GET /boards
  # GET /boards.json
  def index
    @boards = Board.all.order(sort_column + ' ' + sort_direction)
  end

  # GET /boards/1
  # GET /boards/1.json
  def show
    @comment = Comment.new
    

  end

  # GET /boards/new
  def new
    @board = Board.new
    
    
    
  end

  # GET /boards/1/edit
  def edit
  end

  # POST /boards
  # POST /boards.json
  def create
    @board = Board.new(board_params)
    @board.ip = request.remote_ip
    
    respond_to do |format|#フォーマットの変更
      if @board.save
      #データベース更新が成功なら実行
        format.html { redirect_to @board, notice: 'Board was successfully created.' }#成功コメント表示
        format.json { render :show, status: :created, location: @board }#showアクションを呼び出し
      else
      #データベース更新が失敗なら実行
        format.html { render :new }#newアクションの呼び出し
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boards/1
  # PATCH/PUT /boards/1.json
  def update
    respond_to do |format|
      if @board.update(board_params)
        format.html { redirect_to @board, notice: 'Board was successfully updated.' }
        format.json { render :show, status: :ok, location: @board }
      else
        format.html { render :edit }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boards/1
  # DELETE /boards/1.json
  def destroy
    @board.destroy
    respond_to do |format|
      format.html { redirect_to boards_url, notice: 'Board was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board = Board.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def board_params
      params.require(:board).permit(:title, :editor, :ip)
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
    end
 
    def sort_column
      Board.column_names.include?(params[:sort]) ? params[:sort] : "title"
    end

end
