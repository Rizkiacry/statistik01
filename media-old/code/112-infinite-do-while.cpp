
#include <iostream>
using namespace std;

int main() {
    int umur;
    while (umur < 0 || umur > 120) {
        cout << "Masukkan umur (0-120): ";
        cin >> umur;
    }
    cout << "Umur Anda: " << umur << endl;
    return 0;
}
