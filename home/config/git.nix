{ pkgs, ... }:

let
    defaultGitConfig = {
        init.defaultBranch = "main";

        # Automatically rebase instead of merging upon `git pull`ing.
        pull.rebase = true;
        user = { };
    };
in
{
    programs.git =
        {
        includes = [
            {
                contents = defaultGitConfig // {
                    user = defaultGitConfig // {
                        name = "Ed Bruce";
                        email = "ecbruce@proton.me";
                    };
                };
            }
        ];
	enable = true;
    };
}
