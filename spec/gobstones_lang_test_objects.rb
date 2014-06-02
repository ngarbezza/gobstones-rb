module GobstonesLangTestObjects

  def clean_context
    program_context_for empty_program
  end

  def program_context_for(program)
    ProgramExecutionContext.for program
  end

  def empty_program
    Program.new no_definitions, no_return_statement
  end

  def no_definitions
    []
  end

  def no_arguments
    VarTuple.empty
  end

  def no_return_statement
    NoReturnStatement.new
  end

end
