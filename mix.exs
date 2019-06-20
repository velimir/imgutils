defmodule ImgUtils.MixProject do
  use Mix.Project

  def project do
    [
      app: :imgutils,
      version: "0.1.0",
      elixir: "~> 1.8",
      description: description(),
      compilers: [:elixir_make] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      elixirc_options: [warnings_as_errors: true],
      test_coverage: [tool: ExCoveralls],
      package: [
        maintainers: ["Grigory Starinkin"],
        files: [
          "lib",
          "mix.exs",
          "Makefile",
          "c_src",
          "README.md",
          "LICENSE"
        ],
        licenses: ["MIT"],
        links: %{"GitHub" => "https://github.com/velimir/imgutils"}
      ],
      source_url: "https://github.com/velimir/imgutils",
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:elixir_make, "~> 0.5.2", runtime: false},
      {:ex_doc, "~> 0.20.2", runtime: false},
      {:excoveralls, "~> 0.11.1", only: :test}
    ]
  end

  defp description() do
    "Collection of image processing utilities."
  end

  defp elixirc_paths(:test), do: ["lib", "test/lib"]
  defp elixirc_paths(_env), do: ["lib"]
end
