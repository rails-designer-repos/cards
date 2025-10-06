Message.destroy_all
Board.destroy_all

messages = [
  { title: "Building Beautiful Rails Applications: A Design-First Approach" },
  { title: "Component-Driven Development in Modern Rails Apps" },
  { title: "Crafting Consistent UI Patterns for Rails Applications" },
  { title: "The Art of Rails UI Engineering: Best Practices" },
  { title: "Responsive Design Patterns for Rails Components" },
  { title: "Streamlining SaaS Development with Rails UI Components" },
  { title: "Design Systems: The Foundation of Professional Rails Apps" },
  { title: "UI Performance Optimization in Rails Applications" },
  { title: "From Legacy to Modern: Revamping Rails UI Architecture" },
  { title: "Accessibility-First Development with Rails Components" },
  { title: "Building a Professional Component Library for Rails" },
  { title: "UI Engineering Patterns for Scalable Rails Apps" }
]

puts "Creating #{Message.count} messages…"
messages.each { Message.create! it }

puts "Create “Messages” board…"
Board.create name: "Messages"

puts "Create columns for board…"
%w[Backlog Read Replied].each { Board::Column.create board: Board.first, name: it }

puts "Randomly assign messages to board's columns…"
Message.all.map { Board::Card.create! resource: it, column: Board::Column.all.sample }

puts "Done 🤙"
