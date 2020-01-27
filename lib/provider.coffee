utility = require './utility'
getCompletions = require './get-completions'

module.exports =
  selector: '*'
  inclusionPriority: 1
  suggestionPriority: 2
  excludeLowerPriority: false
  filterSuggestions: false

  name: 'TabNine'
  grammarScopes: ['*']
  scope: 'file'
  lintsOnChange: false

  getSuggestions: (context) ->
    return [] unless utility.isEnabledForScope context.editor.getRootScopeDescriptor()
    getCompletions(context).catch utility.notifyError []
