RSpec.describe Gobstones::Parser do
  let_it_be(:parser) { TreetopParser.new }

  describe 'removing comments of a gobstones piece of code' do
    it 'removes a one-line comment with // characters for a single line' do
      code_with_comments = 'Poner(Verde) // put a green ball on the board'
      code_without_comments = parser.remove_comments_from(code_with_comments)

      expect(code_without_comments).to eq('Poner(Verde) ')
    end

    it 'removes many one-line comments with //' do
      code_with_comments = <<~CODE
        Poner(Verde)  // put a green ball on the board
        Poner(Azul)   // and a blue one
        // and this is just an entire comment line
      CODE
      code_without_comments = parser.remove_comments_from(code_with_comments)

      expect(code_without_comments).to eq <<~CODE
        Poner(Verde)  
        Poner(Azul)   
        
      CODE
    end

    it 'removes a one-line comment with -- for a single line' do
      code_with_comments = 'Poner(Verde) -- put a green ball on the board'
      code_without_comments = parser.remove_comments_from(code_with_comments)

      expect(code_without_comments).to eq('Poner(Verde) ')
    end

    it 'removes many one-line comments with --' do
      code_with_comments = <<~CODE
        Poner(Verde)  -- put a green ball on the board
        Poner(Azul)   -- and a blue one
        -- and this is just an entire comment line
      CODE
      code_without_comments = parser.remove_comments_from(code_with_comments)

      expect(code_without_comments).to eq <<~CODE
        Poner(Verde)  
        Poner(Azul)   
        
      CODE
    end

    it 'removes many one-line comments with // and --' do
      code_with_comments = <<~CODE
        Poner(Verde)  // put a green ball on the board
        Poner(Azul)   -- and a blue one
        // and this is just an entire comment line
        if (puedeMover(Norte)) { Mover(Norte) } -- another -- comment
      CODE
      code_without_comments = parser.remove_comments_from(code_with_comments)

      expect(code_without_comments).to eq <<~CODE
        Poner(Verde)  
        Poner(Azul)   
        
        if (puedeMover(Norte)) { Mover(Norte) } 
      CODE
    end

    it 'removes a multiline comment with {- -}' do
      code_with_comments = 'Poner(Verde)  {- this is a comment -}'
      code_without_comments = parser.remove_comments_from(code_with_comments)

      expect(code_without_comments).to eq('Poner(Verde)  ')
    end

    it 'removes many multiline comments with {- -}, in same and different lines' do
      code_with_comments = <<~CODE
        Poner(Verde)  {- comment 1 -}
        Poner(Azul)   {- start comment 2
        // and this is just an entire comment line
        if (puedeMover(Norte)) { Mover(Norte) -}
        Poner(Rojo)
      CODE
      code_without_comments = parser.remove_comments_from(code_with_comments)

      expect(code_without_comments).to eq <<~CODE
        Poner(Verde)  
        Poner(Azul)   
        Poner(Rojo)
      CODE
    end

    it 'removes a multiline comment with /* */' do
      code_with_comments = 'Poner(Verde)  /* this is a comment */'
      code_without_comments = parser.remove_comments_from(code_with_comments)

      expect(code_without_comments).to eq('Poner(Verde)  ')
    end

    it 'removes many multiline comments with /* */, in same and different lines' do
      code_with_comments = <<~CODE
        Poner(Verde)  /* comment 1 */
        Poner(Azul)   /* start comment 2
        // and this is just an entire comment line
        if (puedeMover(Norte)) { Mover(Norte) */
        Poner(Rojo)
      CODE
      code_without_comments = parser.remove_comments_from(code_with_comments)

      expect(code_without_comments).to eq <<~CODE
        Poner(Verde)  
        Poner(Azul)   
        Poner(Rojo)
      CODE
    end
  end
end
