
#include <iostream>

int main() {
  using namespace std;
  char cont;
  do {
    int n;
    cout << "=== Dimensional Rift Pattern Scanner "
            "==="
         << endl;
    cout << "Input ukuran pattern: ";
    cin >> n;

    int total_stars = 0;
    if (n > 0) {
      total_stars = n * (n + 1) / 2;
    }
    cout << "Total stars: " << total_stars << endl;
    cout << "Monster: ";
    if (n > 30) {
      cout << "VECNA" << endl;
    } else if (n >= 11) {
      cout << "MIND FLAYER" << endl;
    } else {
      cout << "DEMOGORGON" << endl;
    }

    cout << "Pattern:" << endl;
    if (n > 0) {
      for (int i = 1; i <= n; ++i) {
        for (int j = 1; j <= i; ++j) {
          cout << "* ";
        }
        cout << endl;
      }
    }

    cout << "\nCoba lagi (y/n)? ";
    cin >> cont;
    cout << endl;
  } while (cont == 'y' || cont == 'Y');
  return 0;
}
