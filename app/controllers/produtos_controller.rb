class ProdutosController < ApplicationController
  #before_action :authenticate_request, only: [:create, :update, :destroy]
  before_action :set_produto, only: %i[ show update destroy ]

  # GET /produtos
  def index
    @produtos = Produto.all

    if @produtos 
      render json: @produtos
    else
      render json: {
        status: 'ok', 
        message: 'Sem produtos cadastrados'
      }
    end
  end

  # GET /produtos/1
  def show
    render json: @produto
  end

  # POST /produtos
  def create
    @produto = Produto.new(produto_params)

    if @produto.save
      render json: @produto, status: :created, location: @produto
    else
      render json: @produto.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /produtos/1
  def update
    if @produto.update(produto_params)
      render json: @produto
    else
      render json: @produto.errors, status: :unprocessable_entity
    end
  end

  # DELETE /produtos/1
  def destroy
    @produto.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_produto
      @produto = Produto.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def produto_params
      params.require(:produto).permit(:nome, :quantidade, :preco)
    end
end
