defmodule Skills do
  defmacro __using__(level) do
    quote do
      def upgrade do
        IO.puts("Upgrading skills to level #{unquote(level)}")
      end
    end
  end

  defmacro learn_fireball do
    quote do
      def fireball do
        IO.puts("Fireball")
      end
    end
  end

  def attack do
    IO.puts("Attacking")
  end
end

defmodule Warrior do
  import Skills

  Skills.learn_fireball

  def action do
    attack()
  end
end

defmodule Healer do
  require Skills

  Skills.learn_fireball

  # this code will fail
  # def action do
  #   attack()
  # end
end

defmodule Champion do
  use Skills, "champ"

  Skills.learn_fireball

  # this code will fail
  # def action do
  #   attack()
  # end
end
