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
    attribs = { action: params[:url] || '#', method: 'post' }
    Tag.build('form', attribs) { build_fields(user, &block).join }
  end

  #
  # builds fields collected by FormFieldsCollector
  #
  # @param [User] user user
  #
  # @return [Array<String>] fields
  #
  def self.build_fields(user)
    return [] unless block_given?

    form_fields_collector = FormFieldsCollector.new(user)
    yield(form_fields_collector)
    form_fields_collector.fields.map do |field|
      if field[:nested]
        Tag.build(field[:type], field[:attributes]) { field[:body] }
      else
        Tag.build(field[:type], field[:attributes])
      end
    end
  end

  class FormFieldsCollector
    attr_reader :fields

    def initialize(entity)
      @entity = entity
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
    def input(name, params = {})
      return textarea(name) if params[:as] == :text

      field = {
        type: 'input',
        attributes: { name: name, type: 'text', value: @entity.public_send(name) }
      }

      @fields << field
    end

    def textarea(name)
      field = {
        type: 'textarea',
        attributes: {
          cols: 20,
          rows: 40,
          name: name
        },
        nested: true,
        body: @entity.public_send(name)
      }

      @fields << field
    end

    def submit(value = 'Save')
      field = {
        type: 'input',
        attributes: { type: 'input', name: 'commit', value: value }
      }

      @fields << field
    end
  end
end
