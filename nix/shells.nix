{ pkgs, packages, env, shellHook }:

with env;
{
  default = pkgs.mkShell {
    buildInputs = env.system ++ env.main ++ env.dev ++ env.lint ++ [ ];
    inherit shellHook;
  };
  ci = pkgs.mkShell {
    buildInputs = env.system ++ env.main ++ env.lint ++ [ ];
    inherit shellHook;
  };
  cd = pkgs.mkShell {
    buildInputs = env.system ++ env.main ++ env.release;
    inherit shellHook;
  };
}
