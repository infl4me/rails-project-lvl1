# frozen_string_literal: true

module HexletCode
  User = Struct.new(:name, :job, :gender, keyword_init: true)

  #
  # generates form
  #
  # @param [User] user user
  # @param [Hash] params params
  #
  # @return [String] form
  #
  def self.form_for(user, params = {}, &block)
    fields = block ? build_fields(user, &block) : []

    attribs = { action: params[:url] || '#', method: 'post' }
    Tag.build('form', attribs) { fields.join }
  end

  #
  # builds fields collected by FormFieldsCollector
  #
  # @param [User] user user
  #
  # @return [Array<String>] fields
  #
  def self.build_fields(user)
    form_fields_collector = FormFieldsCollector.new
    yield(form_fields_collector)
    form_fields_collector.fields.map do |field|
      case field[:params][:as]
      when :text
        Tag.build('textarea', { cols: 20, rows: 40, name: field[:name] }) { user[field[:name]] }
      when :input
        Tag.build('input', { name: field[:name], type: 'text', value: user[field[:name]] })
      end
    end
  end

  class FormFieldsCollector
    attr_reader :fields

    def initialize
      @fields = []
    end

    #
    # generates input tag
    #
    # @param [String] name value of name attribute
    # @param [Hash] params params
    #
    # @return [String] input
    #
    def input(name, params = { as: :input })
      @fields << { name: name, params: params }
    end
  end
end
