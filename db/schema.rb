# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150511154926) do

  create_table "bolaos", force: :cascade do |t|
    t.string   "arquivo_file_name"
    t.string   "arquivo_content_type"
    t.integer  "arquivo_file_size"
    t.datetime "arquivo_updated_at"
  end

  create_table "loteria", force: :cascade do |t|
    t.string  "nome"
    t.string  "sigla"
    t.integer "qtd_min_dezenas"
    t.integer "qtd_max_dezenas"
    t.integer "min_soma"
    t.integer "max_soma"
    t.integer "max_pares"
    t.integer "min_pares"
    t.integer "max_impares"
    t.integer "min_impares"
    t.integer "mais_sorteados"
    t.integer "min_mais_sorteados"
    t.integer "max_mais_sorteados"
    t.integer "max_menos_sorteados"
    t.integer "min_colunas_cheias"
    t.integer "max_colunas_cheias"
    t.integer "min_linhas_cheias"
    t.integer "max_linhas_cheias"
    t.integer "min_colunas_vazias"
    t.integer "max_colunas_vazias"
    t.integer "min_linhas_vazias"
    t.integer "max_linhas_vazias"
    t.integer "min_mesma_linha"
    t.integer "max_mesma_linha"
    t.integer "min_mesma_coluna"
    t.integer "max_mesma_coluna"
    t.integer "min_coluna_esquerda_direita"
    t.integer "min_digitos"
    t.integer "max_digitos"
    t.integer "min_sequencia"
    t.integer "max_sequencia"
    t.text    "linhas"
    t.text    "colunas"
    t.text    "colunas_da_esquerda"
    t.text    "colunas_da_direita"
    t.text    "menos_sorteados"
    t.text    "multiplos"
  end

  create_table "palpites", force: :cascade do |t|
    t.integer "bolao_id"
    t.string  "dezenas"
    t.integer "pontos"
  end

end
