#include <iostream>
#include <string>
#include <utility>
#include <vector>

using ll = long long;

const std::vector<std::pair<ll, ll>> ranges {
#include "./in.cpp"
//#include "./in.example.cpp"
};

struct Node {
	ll value{};
	Node *left{};
	Node *rite{};

	static void update(Node *&node, ll p, ll q, ll l, ll r) {
		if (r <= p || q <= l) {
			return;
		} else if (p <= l && r <= q) {
			if (!node) {
				node = new Node{r - l, nullptr, nullptr};
			} else {
				node->value = r - l;
			}
		} else {
			ll mid = (l + r) / 2;

			if (!node) {
				node = new Node{};
			} else if (node->value == r-l) {
				return;
			}

			update(node->left, p, q, l, mid);
			update(node->rite, p, q, mid, r);

			node->value = 0;
			if (node->left) node->value += node->left->value;
			if (node->rite) node->value += node->rite->value;
		}
	}

	void print(std::string &padstr, ll l, ll r) {
		if (r-l < 100) std::cout << padstr << "{value="<<value<<", ["<<l<<", "<<r<<")}" << '\n';
		padstr.push_back(' ');
		ll mid = (l + r) / 2;
		if (left) left->print(padstr, l, mid);
		if (rite) rite->print(padstr, mid, r);
		padstr.pop_back();
	}

	~Node() {
		delete left;
		delete rite;
	}
};

constexpr ll MAXVAL = 1LL << 50;

int main() {

	Node *root = new Node{};
	
	for (auto [a, b] : ranges) {
		Node::update(root, a, b+1, 0, MAXVAL);

		std::cout << "post update on [a="<<a<<", b="<<b+1<<")\n";
		std::string padstr = "";
		root->print(padstr, 0, MAXVAL);
	}

	std::cout << root << '\n';

	std::string padstr = "";
	root->print(padstr, 0, MAXVAL);

	std::cout << root->value << '\n';

	delete root;
}
