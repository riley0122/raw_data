fn main() {
    // Specify the directory where the C library is located
    println!("cargo:rustc-link-search=native=lib");

    // Specify the name of the C library to link against
    println!("cargo:rustc-link-lib=dylib=provider");
}
