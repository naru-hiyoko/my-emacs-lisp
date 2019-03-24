:application.loaded_applications
|> Enum.each(fn ({app, _, _}) ->
  {:ok, mods} = :application.get_key(app, :modules)
  mods |> Enum.each(fn m ->
    #IO.inspect m
    try do
      m.__info__(:functions)
      |> Enum.each(fn {name, arity} ->
        IO.inspect "#{m}.#{name}/#{arity}"
      end)
    rescue
      _ -> []
    end
  end)
end)
