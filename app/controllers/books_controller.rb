class BooksController < ApplicationController
  def index  #データ一覧、新規作成フォーム(index.html.erb)を表示
    @books = Book.all  #データ一覧の表示
    @book = Book.new   #新規作成フォームの表示
  end

  def show   #データーの内容(show.html.erb)を表示
    @book = Book.find(params[:id])   #特定idの値を取得
  end
  
  def create   #データーを追加
    @book = Book.new(book_params)  #データを受け取り、新規登録のインスタンス生成
    if @book.save  #データーベースに保存し、true(データがある)の場合
      flash[:success] = "Book was successfully created"  #メッセージを表示
      redirect_to book_path(@book.id)  #show画面へリダイレクト
    else
      @books = Book.all   #エラー時に使用するインスタンスを再定義
      render :index   #false(データがない)の場合index.html.erbに表示
    end
    # redirect_to ルーティングの名称_path(createアクション.idカラム)
  end  
  
  def edit  #データーを更新するフォーム(edit.html.erb)を表示
    @book = Book.find(params[:id])  #特定のidの値を取得
  end
  
  def update  #データーを更新
    @book = Book.find(params[:id])   #特定のidの値を取得
    if @book.update(book_params)   #as:bookのparams(データ)を更新し、データがある場合
      flash[:success] = "Book was successfully created"   #メッセージを表示
      redirect_to book_path(@book.id)  #showページへリダイレクト
    else
      @books = Book.all  #エラー時に使用するインスタンスを再定義
      render :edit   #falseの場合はedit.html.erbに表示
    end  
  end
  
  def destroy  #データーを削除
    book = Book.find(params[:id])   #特定のidの値を取得
    book.destroy   #該当idのデーターを削除
    redirect_to books_path
  end
  
  private
  #ストロングパラメーター
  def book_params
    params.require(:book).permit(:title,:body)
    #params:formから送られるデーター
    #require:その中からモデル名bookのデータを指定
    #permit:その中から保存を許可するカラムtitle,bodyを指定
  end
end