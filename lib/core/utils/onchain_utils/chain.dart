import 'package:reown_appkit/appkit_modal.dart';
import 'package:stomata_app/core/utils/logging.dart';

class ChainNetwork {
  // Definisi chain-ReownAppKitModalNetworkInfo yang ada dengan chainId dalam bentuk string angka
  static final ethMainnet = ReownAppKitModalNetworkInfo(
    name: 'Ethereum Mainnet',
    chainId: '1',
    currency: 'ETH',
    rpcUrl: 'https://mainnet.infura.io/v3/YOUR_INFURA_PROJECT_ID',
    explorerUrl: 'https://etherscan.io',
  );

  static final ethSepolia = ReownAppKitModalNetworkInfo(
    name: 'Ethereum Sepolia',
    chainId: '11155111',
    currency: 'ETH',
    rpcUrl: 'https://sepolia.infura.io/v3/YOUR_INFURA_PROJECT_ID',
    explorerUrl: 'https://sepolia.etherscan.io',
  );

  static final optimism = ReownAppKitModalNetworkInfo(
    name: 'Optimism',
    chainId: '10',
    currency: 'ETH',
    rpcUrl: 'https://mainnet.optimism.io',
    explorerUrl: 'https://optimistic.etherscan.io',
  );

  static final optimismSepolia = ReownAppKitModalNetworkInfo(
    name: 'Optimism Sepolia',
    chainId: '11155420',
    currency: 'ETH',
    rpcUrl: 'https://sepolia.optimism.io',
    explorerUrl: 'https://sepolia-optimistic.etherscan.io',
  );

  static final polygon = ReownAppKitModalNetworkInfo(
    name: 'Polygon',
    chainId: '137',
    currency: 'MATIC',
    rpcUrl: 'https://polygon-rpc.com',
    explorerUrl: 'https://polygonscan.com',
  );

  static final polygonSepolia = ReownAppKitModalNetworkInfo(
    name: 'Polygon Sepolia',
    chainId: '11155111',
    currency: 'ETH',
    rpcUrl: 'https://sepolia-rpc.polygon.io',
    explorerUrl: 'https://sepolia.polygonscan.com',
  );

  static final polygonAmoy = ReownAppKitModalNetworkInfo(
    name: 'Polygon Amoy',
    chainId: '80002',
    currency: 'ETH',
    rpcUrl: 'https://polygon-amoy-rpc.polygon.io',
    explorerUrl: 'https://amoy.polygonscan.com',
  );

  static final bsc = ReownAppKitModalNetworkInfo(
    name: 'BSC',
    chainId: '56',
    currency: 'BNB',
    rpcUrl: 'https://bsc-dataseed.binance.org/',
    explorerUrl: 'https://bscscan.com',
  );

  static final bscSepolia = ReownAppKitModalNetworkInfo(
    name: 'BSC Sepolia',
    chainId: '11155111',
    currency: 'BNB',
    rpcUrl:
        'https://sepolia-bsc-rpc.io', // Gunakan alamat RPC resmi dari Binance jika tersedia.
    explorerUrl: 'https://sepolia.bscscan.com',
  );

  static final base = ReownAppKitModalNetworkInfo(
    name: 'Base',
    chainId: '8453',
    currency: 'ETH',
    rpcUrl: 'https://mainnet.base.org',
    explorerUrl: 'https://base.org/explorer',
  );

  static final baseSepolia = ReownAppKitModalNetworkInfo(
    name: 'Base Sepolia',
    chainId: '84532',
    currency: 'ETH',
    rpcUrl: 'https://sepolia.base.org',
    explorerUrl: 'https://sepolia.base.org/explorer',
  );

  static void displayAllChains() {
    List<ReownAppKitModalNetworkInfo> chains = [
      ethMainnet,
      ethSepolia,
      optimism,
      optimismSepolia,
      polygon,
      polygonSepolia,
      polygonAmoy,
      bsc,
      bscSepolia,
      base,
      baseSepolia,
    ];

    for (var chain in chains) {
      printLog('Chain Name: ${chain.name}');
      printLog('Chain ID: ${chain.chainId}');
      printLog('RPC URL: ${chain.rpcUrl}');
      printLog('Block Explorer URL: ${chain.explorerUrl}');
      printLog('--------------------------');
    }
  }
}
