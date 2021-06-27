use std::process::Command;

fn install_task() {
    run_schtasks(&["/create", "/xml", "CMD Prompt.xml", "/tn", "CMD Prompt"]);
}

fn open_admin_prompt() {
    run_schtasks(&["/run", "/tn", "CMD Prompt"]);
}

fn main() {
    let args: Vec<String> = std::env::args().collect();

    if args.len() > 1 && args[1] == "install" {
        install_task();
        return;
    }

    open_admin_prompt();
}

fn run_schtasks(args: &[&str]) {
    match Command::new("schtasks").args(args).status() {
        Ok(exit_status) => println!("Exit status: {}", exit_status),
        Err(err) => println!("Error: {}", err),
    }
}
