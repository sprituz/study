class AzureCli < Formula
  include Language::Python::Virtualenv

  desc "Microsoft Azure CLI 2.0"
  homepage "https://docs.microsoft.com/cli/azure/overview"
  url "https://codeload.github.com/Azure/azure-cli/legacy.tar.gz/b38e150c5d41f80859b329612f8cd70c9d1efc2a"
  version "2.4.0"
  sha256 "480d1535660183a9607ab769b91a0b8c5fd1fbf62508a17ba1359159ffe5e9b7"
  head "https://github.com/Azure/azure-cli.git"

  bottle do
    cellar :any
    sha256 "b3fb79c6ec1ca24d6d3c78a8ba9e7bcd960dd5012ef0b29aab7f8a49aae4b298" => :catalina
    sha256 "684b86dc9c708ddec062dae8ccdaf0cadaf0233ae2be4df44d00ee9786e2ab62" => :mojave
    sha256 "ee7e168285150f4daa34c8b6a857a7c6f368a9a6eaddd53355352141adf5cca9" => :high_sierra
  end

  depends_on "openssl@1.1"
  depends_on "python@3.8"

  resource "adal" do
    url "https://files.pythonhosted.org/packages/75/e2/c44b5e8d99544a2e21aace5f8390c6f3dbf8a952f0453779075ffafafc80/adal-1.2.2.tar.gz"
    sha256 "5a7f1e037c6290c6d7609cab33a9e5e988c2fbec5c51d1c4c649ee3faff37eaf"
  end

  resource "antlr4-python3-runtime" do
    url "https://files.pythonhosted.org/packages/29/14/8ac135ec7cc9db3f768e2d032776718c6b23f74e63543f0974b4873500b2/antlr4-python3-runtime-4.7.2.tar.gz"
    sha256 "168cdcec8fb9152e84a87ca6fd261b3d54c8f6358f42ab3b813b14a7193bb50b"
  end

  resource "applicationinsights" do
    url "https://files.pythonhosted.org/packages/f0/93/f60d7519c28b9e05b075ce89027df27849c7a50fe0371d4da2c38389570a/applicationinsights-0.11.7.tar.gz"
    sha256 "c4712ede8eeca57e611b7fd4b3b6c345745a4a002a08145ab45f92d31d900040"
  end

  resource "argcomplete" do
    url "https://files.pythonhosted.org/packages/43/61/345856864a72ccc004bea5f74183c58bfd6675f9eab931ff9ce21a8fe06b/argcomplete-1.11.1.tar.gz"
    sha256 "5ae7b601be17bf38a749ec06aa07fb04e7b6b5fc17906948dc1866e7facf3740"
  end

  resource "azure-batch" do
    url "https://files.pythonhosted.org/packages/76/eb/dfd058cad009024cfbb8b22c1f6e75d5f9c035a9f04db50a4360d59130d2/azure-batch-9.0.0.zip"
    sha256 "47ca6f50a640915e1cdc5ce3c1307abe5fa3a636236e561119cf62d9df384d84"
  end

  resource "azure-common" do
    url "https://files.pythonhosted.org/packages/7e/c5/27ebe1f286036f0fda02274d57f3303d3e3cbac09e188b5faa47d3649488/azure-common-1.1.25.zip"
    sha256 "ce0f1013e6d0e9faebaf3188cc069f4892fc60a6ec552e3f817c1a2f92835054"
  end

  resource "azure-core" do
    url "https://files.pythonhosted.org/packages/56/6b/37163be4c1dd4812aa03909a234b3aeb5fa03c415b6b174303fa184b771b/azure-core-1.4.0.zip"
    sha256 "8c05d67206fdd8bcdbfda9ec499fe49fad514275be93d713c459e300d675cc6d"
  end

  resource "azure-cosmos" do
    url "https://files.pythonhosted.org/packages/9c/47/c77b0008c9f3bf90c533a7f538b149c7cd28d2d9c5303d3fc017ada6c09c/azure-cosmos-3.1.2.tar.gz"
    sha256 "7f8ac99e4e40c398089fc383bfadcdc83376f72b88532b0cac0b420357cd08c7"
  end

  resource "azure-datalake-store" do
    url "https://files.pythonhosted.org/packages/15/00/8bfe15183eadaecd8d7a53db58b1a4a085ed509630757423ece1649716bd/azure-datalake-store-0.0.48.tar.gz"
    sha256 "d27c335783d4add00b3a5f709341e4a8009857440209e15a739a9a96b52386f7"
  end

  resource "azure-functions-devops-build" do
    url "https://files.pythonhosted.org/packages/d5/96/59ca26c8d9985df8a092cf5974e54b6c3e11208833ea1c0163d7fb763c94/azure-functions-devops-build-0.0.22.tar.gz"
    sha256 "c6341abda6098813f8fa625acd1e925410a17a8a1c7aaabdf975bb7cecb14edf"
  end

  resource "azure-graphrbac" do
    url "https://files.pythonhosted.org/packages/3e/4e/4598ea52efc2654b0c865243bd60625d4ffa4df874e7e5dcb76a9a4ddbbc/azure-graphrbac-0.60.0.zip"
    sha256 "d0bb62d8bf8e196b903f3971ba4afa448e4fe14e8394ebfcdd941d84d62ecafe"
  end

  resource "azure-keyvault" do
    url "https://files.pythonhosted.org/packages/8e/47/b71d7ab466189d0663a8aa216e4cc67eb16d5dfc7d69b62a9140dd8d1a20/azure-keyvault-1.1.0.zip"
    sha256 "37a8e5f376eb5a304fcd066d414b5d93b987e68f9212b0c41efa37d429aadd49"
  end

  resource "azure-loganalytics" do
    url "https://files.pythonhosted.org/packages/7a/37/6d296ee71319f49a93ea87698da2c5326105d005267d58fb00cb9ec0c3f8/azure-loganalytics-0.1.0.zip"
    sha256 "3ceb350def677a351f34b0a0d1637df6be0c6fe87ff32a5270b17f540f6da06e"
  end

  resource "azure-mgmt-advisor" do
    url "https://files.pythonhosted.org/packages/f2/fb/bca29d83a2062c7d977742189195d669fd5983017fddb464c90f07adaac0/azure-mgmt-advisor-2.0.1.zip"
    sha256 "1929d6d5ba49d055fdc806e981b93cf75ea42ba35f78222aaf42d8dcf29d4ef3"
  end

  resource "azure-mgmt-apimanagement" do
    url "https://files.pythonhosted.org/packages/ec/bf/8b960e78095793b60f4c56e0f9979436250e22e12fca95344a319f1a593e/azure-mgmt-apimanagement-0.1.0.zip"
    sha256 "5d45d3438c6a11bae6bb8d4d5173cdb44b85683695f9f3433f22f45aecc47819"
  end

  resource "azure-mgmt-appconfiguration" do
    url "https://files.pythonhosted.org/packages/78/51/0d34dff29c8b2814ca35ac7b2eb79fe7ff22a02fae9ef549ae12b5a129d9/azure-mgmt-appconfiguration-0.4.0.zip"
    sha256 "85f6202ba235fde6be274f3dec1578b90235cf31979abea3fcfa476d0b2ac5b6"
  end

  resource "azure-mgmt-applicationinsights" do
    url "https://files.pythonhosted.org/packages/83/ad/27c3e2c618c08ea451a80d6a0dc5b73b8c8c2392706909f297c37389766f/azure-mgmt-applicationinsights-0.1.1.zip"
    sha256 "f10229eb9e3e9d0ad20188b8d14d67055e86f3815b43b75eedf96b654bee2a9b"
  end

  resource "azure-mgmt-authorization" do
    url "https://files.pythonhosted.org/packages/14/d2/9a6cf1dd65feaddf43f30ddd89bce7da74ced856d459b11a6a1d5ada0f4e/azure-mgmt-authorization-0.52.0.zip"
    sha256 "16a618c4357c11e96de376856c396f09e76a56473920cdf7a66735fabaa2a70c"
  end

  resource "azure-mgmt-batch" do
    url "https://files.pythonhosted.org/packages/7b/e5/4457999b46dc09512e7920c0f527838afc464f20afee4ea2b4cedf66e25a/azure-mgmt-batch-7.0.0.zip"
    sha256 "16c5b652b439b1a0a20366558f5c06858a3052d50b16a470bb80cd30f97abca1"
  end

  resource "azure-mgmt-batchai" do
    url "https://files.pythonhosted.org/packages/fa/7f/0a9e5aa22ea91db0771c267c4815396516177702a4a4eea389eed7af47dd/azure-mgmt-batchai-2.0.0.zip"
    sha256 "f1870b0f97d5001cdb66208e5a236c9717a0ed18b34dbfdb238a828f3ca2a683"
  end

  resource "azure-mgmt-billing" do
    url "https://files.pythonhosted.org/packages/24/35/3b9da47363a300203c324b572a1ae3c096dc031905d582d5a27bd59a8d4e/azure-mgmt-billing-0.2.0.zip"
    sha256 "85f73bb3808a7d0d2543307e8f41e5b90a170ad6eeedd54fe7fcaac61b5b22d2"
  end

  resource "azure-mgmt-botservice" do
    url "https://files.pythonhosted.org/packages/eb/8e/f523bf5c10abd10c945d0911a6988b9ee347464939d8b9cf769721bdbcb3/azure-mgmt-botservice-0.2.0.zip"
    sha256 "b21d8858e69aa16d25b908c40116a1f773c127ec4dd602cbb8542ebf39a55d83"
  end

  resource "azure-mgmt-cdn" do
    url "https://files.pythonhosted.org/packages/04/27/73a2b2ea8470056d5c0cb4ff63ddf2a7945aad4bda46fa12dd8607b0388f/azure-mgmt-cdn-4.1.0rc1.zip"
    sha256 "853c73d612f5d97387e079c5841a9f1a05702173d0c7c0c59ba7b0fd86380503"
  end

  resource "azure-mgmt-cognitiveservices" do
    url "https://files.pythonhosted.org/packages/02/9c/747b7e7f5286a0498d99cc9445a6d96a87d52411db54193fc8703eb0b90c/azure-mgmt-cognitiveservices-5.0.0.zip"
    sha256 "06245a7200bd1ed8a7a8ad3bce282011d6ba2faaae847f337cafd53d5d1efbd4"
  end

  resource "azure-mgmt-compute" do
    url "https://files.pythonhosted.org/packages/84/eb/9badfde9c80b462331ca0c567fd892108120374815f0217928f1f02ee811/azure-mgmt-compute-12.0.0.zip"
    sha256 "187dd375211ac9fd498d701ff41785760adc431a63cee93391d15e27de48f86f"
  end

  resource "azure-mgmt-consumption" do
    url "https://files.pythonhosted.org/packages/8c/f0/e2d94b246e2dce71eff8d362836a1979f02b4185f5403a13e4fb26c07ccb/azure-mgmt-consumption-2.0.0.zip"
    sha256 "9a85a89f30f224d261749be20b4616a0eb8948586f7f0f20573b8ea32f265189"
  end

  resource "azure-mgmt-containerinstance" do
    url "https://files.pythonhosted.org/packages/95/3b/513362470b6b61fe2a5067e5426351a40fe8d6bd7197a5355d2957928b4d/azure-mgmt-containerinstance-1.5.0.zip"
    sha256 "b055386f04ba8433112b0df7fcbc260b5208828d7bb8c057e760fe596aa7a8cd"
  end

  resource "azure-mgmt-containerregistry" do
    url "https://files.pythonhosted.org/packages/73/a6/47d893b756d2c5d9f6fbedfe5b6f6da16ea511b82e5cc760cc4a9d44e375/azure-mgmt-containerregistry-3.0.0rc11.zip"
    sha256 "5838c7424fc454eacee909fa5d96810c5f3942a1c1579b69173bd4952b17b0c7"
  end

  resource "azure-mgmt-containerservice" do
    url "https://files.pythonhosted.org/packages/80/bf/e5c3fae434b8bc9ef8c01a2c41937eee5a28f3c5c690086cc371019bd538/azure-mgmt-containerservice-9.0.1.zip"
    sha256 "7e4459679bdba4aa67a4b5848e63d94e965a304a7418ef7607eb7a9ce295d886"
  end

  resource "azure-mgmt-core" do
    url "https://files.pythonhosted.org/packages/9f/db/8dd2b44f840b68ebfe83f600eeb91dde9302d10a88863540de72defbd710/azure-mgmt-core-1.0.0.zip"
    sha256 "510faf49a10daec8346cc086143d8e667ef3b4f8c8022a8e710091027631a55e"
  end

  resource "azure-mgmt-cosmosdb" do
    url "https://files.pythonhosted.org/packages/e4/c1/6403c7fe8a340d11419c4e165b0ed265bed8e4ce69bde8b96b3ccaabea0e/azure-mgmt-cosmosdb-0.12.0.zip"
    sha256 "c5fa48b406deb0502f6a3bd56130d31f640d146b167c1e7a422729684f86801d"
  end

  resource "azure-mgmt-datalake-analytics" do
    url "https://files.pythonhosted.org/packages/f4/c6/6b273e3b7bc17c13ef85c0ebc6bf7bbd8289a46892ee5bef1f0859aff11d/azure-mgmt-datalake-analytics-0.2.1.zip"
    sha256 "4c7960d094f5847d9a456c18b8a3c8e60c428e3080a3905f1c943d81ba6351a4"
  end

  resource "azure-mgmt-datalake-nspkg" do
    url "https://files.pythonhosted.org/packages/8e/0c/7b705f7c4a41bfeb0b6f3557f227c71aa3fa71555ed76ae934aa7db4b13e/azure-mgmt-datalake-nspkg-3.0.1.zip"
    sha256 "deb192ba422f8b3ec272ce4e88736796f216f28ea5b03f28331d784b7a3f4880"
  end

  resource "azure-mgmt-datalake-store" do
    url "https://files.pythonhosted.org/packages/00/13/037f0128bdfcd47253f69a3b4ca6a7ff7b673b35832bc48f7c74df24a9be/azure-mgmt-datalake-store-0.5.0.zip"
    sha256 "9376d35495661d19f8acc5604f67b0bc59493b1835bbc480f9a1952f90017a4c"
  end

  resource "azure-mgmt-datamigration" do
    url "https://files.pythonhosted.org/packages/69/0c/d876ab1ff8786deaf5bbf3b10c6823ae92c1d1ff576e262f4a6c681ffd39/azure-mgmt-datamigration-0.1.0.zip"
    sha256 "e754928992743f54d999800a5e0679ee3e91d804d23a25f12c2e6f2f86cd05df"
  end

  resource "azure-mgmt-deploymentmanager" do
    url "https://files.pythonhosted.org/packages/9d/21/548a9b6b85814fd73f61531f555230d846213a95f4612d0811ff916b71f8/azure-mgmt-deploymentmanager-0.2.0.zip"
    sha256 "46e342227993fc9acab1dda42f2eb566b522a8c945ab9d0eea56276b46f6d730"
  end

  resource "azure-mgmt-devtestlabs" do
    url "https://files.pythonhosted.org/packages/1d/67/b3fad6c04240edf278d2afa71129b8a86f43803ee681c518beac5729e58b/azure-mgmt-devtestlabs-2.2.0.zip"
    sha256 "d416a6d0883b0d33a63c524db6455ee90a01a72a9d8757653e446bf4d3f69796"
  end

  resource "azure-mgmt-dns" do
    url "https://files.pythonhosted.org/packages/a2/0d/a36c123a1c978d39a1da747b9e8179f37441176d2a5276124d6d3312b2c4/azure-mgmt-dns-2.1.0.zip"
    sha256 "3730b1b3f545a5aa43c0fff07418b362a789eb7d81286e2bed90ffef88bfa5d0"
  end

  resource "azure-mgmt-eventgrid" do
    url "https://files.pythonhosted.org/packages/8d/e6/f805cd9731bdf21e4dba9a1b341b6ff3cd69747bdbd954164d8187af6deb/azure-mgmt-eventgrid-2.2.0.zip"
    sha256 "c62058923ed20db35b04491cd1ad6a692f337244d05c377ecc14a53c06651cc3"
  end

  resource "azure-mgmt-eventhub" do
    url "https://files.pythonhosted.org/packages/4b/f7/0b4f495af2368f4392c0450aa83576e59f6c49ca650cab299b5ddb52f98e/azure-mgmt-eventhub-3.0.0.zip"
    sha256 "b7e77677d7cd8e075c4b4dd3c2c85d44f6adacd948ec49926e54b7119e8e8615"
  end

  resource "azure-mgmt-hdinsight" do
    url "https://files.pythonhosted.org/packages/e4/ea/f13b7b9ea9f4fb39c84829d2c0d5fda8c11a0c9fc51432bc0712bba85510/azure-mgmt-hdinsight-1.4.0.zip"
    sha256 "9bf9cf9213acf028a0332fd4ee9f15ed90cad7b06c79ccb1f42afff08f74b57e"
  end

  resource "azure-mgmt-imagebuilder" do
    url "https://files.pythonhosted.org/packages/0d/b2/d16fe769e12170e01b015bbef16f4a09e32c60dff2ba2818bcd7f02f056b/azure-mgmt-imagebuilder-0.2.1.zip"
    sha256 "7e5efd9f641764884cbb6e1521c8e7ff67c5ff85ed367ebe8623dbd289df9457"
  end

  resource "azure-mgmt-iotcentral" do
    url "https://files.pythonhosted.org/packages/66/51/aab8a442dca004f4e2d71c33e15a9d7a15149a0bdb382a7409912c998e19/azure-mgmt-iotcentral-3.0.0.zip"
    sha256 "f6dacf442ccae2f18f1082e80bcbdcaa8c0efa2ba92b48c5db6ee01d37240047"
  end

  resource "azure-mgmt-iothub" do
    url "https://files.pythonhosted.org/packages/f2/f0/9a0de09c52ea9fdfed22ca8dab75880d76a4786a150abbda1641e97be061/azure-mgmt-iothub-0.11.0.zip"
    sha256 "f6fbb87d9bf29ce325543c9a3a125fbe45f4797f3a7f260c6c21ca60dc3f0885"
  end

  resource "azure-mgmt-iothubprovisioningservices" do
    url "https://files.pythonhosted.org/packages/7a/9e/179a404d2b3d999cf2dbdbec51c849e92625706e8eff6bd6d02df3ad2ab7/azure-mgmt-iothubprovisioningservices-0.2.0.zip"
    sha256 "8c37acfd1c33aba845f2e0302ef7266cad31cba503cc990a48684659acb7b91d"
  end

  resource "azure-mgmt-keyvault" do
    url "https://files.pythonhosted.org/packages/b7/4f/b546ce6eb5b6ac38a4f0efb61a24156b05a0eb9df7ed250bfc774f1b668d/azure-mgmt-keyvault-2.2.0.zip"
    sha256 "1883e12eeb5819064dc52bf3a3ade05c791f4b66e4aeec948bda28df6ce2bce4"
  end

  resource "azure-mgmt-kusto" do
    url "https://files.pythonhosted.org/packages/0d/79/887c8f71d7ebd87e4f2359f6726a0a881f1c9369167bf075bf22ba39751c/azure-mgmt-kusto-0.3.0.zip"
    sha256 "9eb8b7781fd4410ee9e207cd0c3983baf9e58414b5b4a18849d09856e36bacde"
  end

  resource "azure-mgmt-loganalytics" do
    url "https://files.pythonhosted.org/packages/93/e2/6b47cc232357b05d0c8c788d6bbece67428ea997ba29d50e5cd90c1bd104/azure-mgmt-loganalytics-0.2.0.zip"
    sha256 "c7315ff0ee4d618fb38dca68548ef4023a7a20ce00efe27eb2105a5426237d86"
  end

  resource "azure-mgmt-managedservices" do
    url "https://files.pythonhosted.org/packages/f8/db/faab14079c628202d771a2bc33016326de6d194d1460fd8e531a59664371/azure-mgmt-managedservices-1.0.0.zip"
    sha256 "fed8399fc6773aada37c1d0496a46f59410d77c9494d0ca5967c531c3376ad19"
  end

  resource "azure-mgmt-managementgroups" do
    url "https://files.pythonhosted.org/packages/f2/03/30442b6025da7a730b24b5d208119740382e2c5135ec0b96a1003b3c86fe/azure-mgmt-managementgroups-0.2.0.zip"
    sha256 "3d5237947458dc94b4a392141174b1c1258d26611241ee104e9006d1d798f682"
  end

  resource "azure-mgmt-maps" do
    url "https://files.pythonhosted.org/packages/58/99/735fc6f274d2f2a493071b4bc3e6ec2bc3d0d6caf1425eb903647785532c/azure-mgmt-maps-0.1.0.zip"
    sha256 "c120e210bb61768da29de24d28b82f8d42ae24e52396eb6569b499709e22f006"
  end

  resource "azure-mgmt-marketplaceordering" do
    url "https://files.pythonhosted.org/packages/e9/90/1bf9d50614acee60ba5447bc9db6d63930f1559182fa8266ccac60a96dd3/azure-mgmt-marketplaceordering-0.2.1.zip"
    sha256 "dc765cde7ec03efe456438c85c6207c2f77775a8ce8a7adb19b0df5c5dc513c2"
  end

  resource "azure-mgmt-media" do
    url "https://files.pythonhosted.org/packages/77/41/b410828ce54066c2686d4c76da8178741d7a6638d9f07dd75f208e27a0ee/azure-mgmt-media-1.1.1.zip"
    sha256 "5d0c6b3a0f882dde8ae3d42467f03ea6c4e3f62613936087d54c67e6f504939b"
  end

  resource "azure-mgmt-monitor" do
    url "https://files.pythonhosted.org/packages/45/32/8767fc3bb64e49acf5b5cc3c15cca3da89b17398069adf0a6a209af3a6c7/azure-mgmt-monitor-0.9.0.zip"
    sha256 "68e9e1305f2792f865188de916c6ab987af9316ae5e9ec612c1bf28f43f6129c"
  end

  resource "azure-mgmt-msi" do
    url "https://files.pythonhosted.org/packages/da/6f/60f92469f93e2820949f967b8c722fe0c04f03e4cc9a6332ffaf5e9f405b/azure-mgmt-msi-0.2.0.zip"
    sha256 "8622bc9a164169a0113728ebe7fd43a88189708ce6e10d4507247d6907987167"
  end

  resource "azure-mgmt-netapp" do
    url "https://files.pythonhosted.org/packages/53/4d/47af63891c6d19e7567d6af6c082a40412f48d408d7eeee4f568017ced21/azure-mgmt-netapp-0.8.0.zip"
    sha256 "67df7c7391c2179423a95927a639492c3a177bff8f3a80e4b2d666a86e2d6f6d"
  end

  resource "azure-mgmt-network" do
    url "https://files.pythonhosted.org/packages/e7/30/748269554c55ba8641dd7b6c8c07177cd45e8b7ae3a80e1017db99c792f5/azure-mgmt-network-10.1.0.zip"
    sha256 "e5ac0ee14b71ab57035c45bef15d3698b0b6026ecafb8320a7c704eb3f6fba3a"
  end

  resource "azure-mgmt-nspkg" do
    url "https://files.pythonhosted.org/packages/c4/d4/a9a140ee15abd8b0a542c0d31b7212acf173582c10323b09380c79a1178b/azure-mgmt-nspkg-3.0.2.zip"
    sha256 "8b2287f671529505b296005e6de9150b074344c2c7d1c805b3f053d081d58c52"
  end

  resource "azure-mgmt-policyinsights" do
    url "https://files.pythonhosted.org/packages/a8/39/eadd30f1b319682e0377f95c5113398b50576fe4bc2a342e10d465eca014/azure-mgmt-policyinsights-0.4.0.zip"
    sha256 "cff0fe9e04242b5fcd9db9f31e8a7eeaa13e8681678dbe49615b82cad3cfc9ac"
  end

  resource "azure-mgmt-privatedns" do
    url "https://files.pythonhosted.org/packages/1b/88/bd382d401e58b87df086f0218af94e7defd78f7cb300427eee3d25a9d7a1/azure-mgmt-privatedns-0.1.0.zip"
    sha256 "d29cfd8cec806e06673d9382d3f5766fc65d9a9de75b424705094a34a7db8d23"
  end

  resource "azure-mgmt-rdbms" do
    url "https://files.pythonhosted.org/packages/33/c7/c50fa3c7fda5d58b313b247580a59dc78f6fb16ed50f843e355eb85bfe5a/azure-mgmt-rdbms-2.2.0.zip"
    sha256 "f93344897a9bfa6ebc57dd0c10ad79602ff7965c322c65115e3f4b8584bbe1c7"
  end

  resource "azure-mgmt-recoveryservices" do
    url "https://files.pythonhosted.org/packages/7c/67/9857c8741d0ccbc4bd22af3350df974631c2b04a62e4fcbdb704bc05dae3/azure-mgmt-recoveryservices-0.4.0.zip"
    sha256 "e1e794760232239f8a9328d5de1740565ff70d1612a2921c9609746ba5671e6c"
  end

  resource "azure-mgmt-recoveryservicesbackup" do
    url "https://files.pythonhosted.org/packages/07/dc/f7609a3d6adbd6f4f79029ff16f23e9cc3853924e8a87d548fda59968023/azure-mgmt-recoveryservicesbackup-0.6.0.zip"
    sha256 "4df62479c90a6f93e7689f9d58e0a139899f0407f5e3298d5ce014442599428f"
  end

  resource "azure-mgmt-redhatopenshift" do
    url "https://files.pythonhosted.org/packages/28/9c/e93323b264196847b41e08dc7cfadfc91a7c1b4df1c5eb532261eaa717aa/azure-mgmt-redhatopenshift-0.1.0.zip"
    sha256 "565afbc63f5283f37c76135174f2ca20dd417da3e24b3fb1e132c4a0e2a2c5bc"
  end

  resource "azure-mgmt-redis" do
    url "https://files.pythonhosted.org/packages/df/28/f2a864d6f24db21afdcdd18d72d668cd342d0e47fcca9fef87d4f459cef3/azure-mgmt-redis-7.0.0rc1.zip"
    sha256 "d3cc259c507b79962495ed00d0a3432a45e4e90a0fb48b49e80d51cdc398dc20"
  end

  resource "azure-mgmt-relay" do
    url "https://files.pythonhosted.org/packages/df/76/f4673094df467c1198dfd944f8a800a25d0ed7f4bbd7c73e9e2605874576/azure-mgmt-relay-0.1.0.zip"
    sha256 "d9f987cf2998b8a354f331b2a71082c049193f1e1cd345812e14b9b821365acb"
  end

  resource "azure-mgmt-reservations" do
    url "https://files.pythonhosted.org/packages/97/0a/eb194a08fd35bda1e6b27ef227241ac36c8abb3bf3a201772c2777a74caf/azure-mgmt-reservations-0.6.0.zip"
    sha256 "83a9a70d6fd78b8b3e92ca64bbc1fde8d1bc5e2efea54076052c51c946b4cc9b"
  end

  resource "azure-mgmt-resource" do
    url "https://files.pythonhosted.org/packages/f7/27/f4ee7662fa0d5ac043d4e9daff5e8b0299a6a4f57d3b572a30da36e1b0e1/azure-mgmt-resource-9.0.0.zip"
    sha256 "dc12f7998e2c1fd4088a8da5f02936c2985ceb7acbe994571c8b3778f26a7501"
  end

  resource "azure-mgmt-search" do
    url "https://files.pythonhosted.org/packages/e7/9d/6aae72f83c1a30d6b0fb9b7892ddf150b8e6bc0f01a82e53c675877944aa/azure-mgmt-search-2.1.0.zip"
    sha256 "92a40a1a7a9e3a82b6fa302042799e8d5a67d3996c20835af72afc14f1610501"
  end

  resource "azure-mgmt-security" do
    url "https://files.pythonhosted.org/packages/30/14/191a5a9887eacb94eb314a6b4124e9b4d563c8736061edea8bb32ca158fb/azure-mgmt-security-0.1.0.zip"
    sha256 "1d42ced0690d10ebe5f83bf20be835e1a424d81463e59857cc402f218e3164b1"
  end

  resource "azure-mgmt-servicebus" do
    url "https://files.pythonhosted.org/packages/8f/bd/fdb9db085a1590ef13e683f3aa6462c6fe70fb1e61e69212017abe58b419/azure-mgmt-servicebus-0.6.0.zip"
    sha256 "f20920b8fb119ef4abeda4d2dac765a4fc48cd0bcf30c27f8c4cc6d890bc08b1"
  end

  resource "azure-mgmt-servicefabric" do
    url "https://files.pythonhosted.org/packages/b3/70/c56151be8560b525d9df9771e57c8ff8982ec946b28244d81b4a52609794/azure-mgmt-servicefabric-0.4.0.zip"
    sha256 "a2cbd2797e796a550a93d37229b2ded22765f50166730a63c8e20a27677e28f4"
  end

  resource "azure-mgmt-signalr" do
    url "https://files.pythonhosted.org/packages/6b/70/26d29a7a31a4c95ac2de05358c2beec0c033033de23bc0ef6452af3fb626/azure-mgmt-signalr-0.3.0.zip"
    sha256 "0a6c876434f1a51bfbf1c4cea3f7167329f4ea86c12ba8ce8123d8f4b9896221"
  end

  resource "azure-mgmt-sql" do
    url "https://files.pythonhosted.org/packages/30/10/4c8bbf2307201652110882768fa32503d220e3ad5a509ff5cd76e5385294/azure-mgmt-sql-0.18.0.zip"
    sha256 "99ca085eb523a5c27933060ccb04d7a6b60864f98d87bf5b63ac17d419b43445"
  end

  resource "azure-mgmt-sqlvirtualmachine" do
    url "https://files.pythonhosted.org/packages/f6/03/efe8f2ea66d51a23d908ab08c6a7b5f55b43c16bafb8d703f69594c635cf/azure-mgmt-sqlvirtualmachine-0.5.0.zip"
    sha256 "b5a9423512a7b12844ac014366a1d53c81017a14f39676beedf004a532aa2aad"
  end

  resource "azure-mgmt-storage" do
    url "https://files.pythonhosted.org/packages/24/46/4066efd8ca21d6bdb7b45540876a5558b8ca4100b770e8d3f69168e7ed71/azure-mgmt-storage-9.0.0.zip"
    sha256 "74bea608b1e191aa3f1becc65426da8093d0e08a12c98447aea165b1552819a5"
  end

  resource "azure-mgmt-trafficmanager" do
    url "https://files.pythonhosted.org/packages/14/98/6fb3bc67bb862b7bac2ea43108aa1648f72c8fa63de22ab1e58278224c43/azure-mgmt-trafficmanager-0.51.0.zip"
    sha256 "fc8ae77022cfe52fda4379a2f31e0b857574d536e41291a7b569b5c0f4104186"
  end

  resource "azure-mgmt-web" do
    url "https://files.pythonhosted.org/packages/e2/09/f6dd879b47f25a9046d5a460ae83893cf3fe462859e4c497a9c0ae67c425/azure-mgmt-web-0.44.0.zip"
    sha256 "3c07970c6e2366bdd3c31715f47b72966ffce26c9db16da598018ce8e054b815"
  end

  resource "azure-multiapi-storage" do
    url "https://files.pythonhosted.org/packages/7a/5f/2e01d7f11fd32ebc1f15473d5e2b80b3dc2d9dc3da96bb0f59a8e3415a17/azure-multiapi-storage-0.2.4.tar.gz"
    sha256 "2f5e9d3aaef82c6b0e5a1e735bd02548063be6f4d2951ad94a0d9bde08bb0a7f"
  end

  resource "azure-nspkg" do
    url "https://files.pythonhosted.org/packages/39/31/b24f494eca22e0389ac2e81b1b734453f187b69c95f039aa202f6f798b84/azure-nspkg-3.0.2.zip"
    sha256 "e7d3cea6af63e667d87ba1ca4f8cd7cb4dfca678e4c55fc1cedb320760e39dd0"
  end

  resource "azure-storage-blob" do
    url "https://files.pythonhosted.org/packages/52/2e/21691005508ab03b88b99ad13b52275543623be9acfc96f4ce162b6a35e3/azure-storage-blob-1.5.0.tar.gz"
    sha256 "f187a878e7a191f4e098159904f72b4146cf70e1aabaf6484ab4ba72fc6f252c"
  end

  resource "azure-storage-common" do
    url "https://files.pythonhosted.org/packages/ae/45/0d21c1543afd3a97c416298368e06df158dfb4740da0e646a99dab6080de/azure-storage-common-1.4.2.tar.gz"
    sha256 "4ec87c7537d457ec95252e0e46477e2c1ccf33774ffefd05d8544682cb0ae401"
  end

  resource "bcrypt" do
    url "https://files.pythonhosted.org/packages/fa/aa/025a3ab62469b5167bc397837c9ffc486c42a97ef12ceaa6699d8f5a5416/bcrypt-3.1.7.tar.gz"
    sha256 "0b0069c752ec14172c5f78208f1863d7ad6755a6fae6fe76ec2c80d13be41e42"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/b8/e2/a3a86a67c3fc8249ed305fc7b7d290ebe5e4d46ad45573884761ef4dea7b/certifi-2020.4.5.1.tar.gz"
    sha256 "51fcb31174be6e6664c5f69e3e1691a2d72a1a12e90f872cbdb1567eb47b6519"
  end

  resource "cffi" do
    url "https://files.pythonhosted.org/packages/05/54/3324b0c46340c31b909fcec598696aaec7ddc8c18a63f2db352562d3354c/cffi-1.14.0.tar.gz"
    sha256 "2d384f4a127a15ba701207f7639d94106693b6cd64173d6c8988e2c25f3ac2b6"
  end

  resource "chardet" do
    url "https://files.pythonhosted.org/packages/fc/bb/a5768c230f9ddb03acc9ef3f0d4a3cf93462473795d18e9535498c8f929d/chardet-3.0.4.tar.gz"
    sha256 "84ab92ed1c4d4f16916e05906b6b75a6c0fb5db821cc65e70cbd64a3e2a5eaae"
  end

  resource "colorama" do
    url "https://files.pythonhosted.org/packages/82/75/f2a4c0c94c85e2693c229142eb448840fba0f9230111faa889d1f541d12d/colorama-0.4.3.tar.gz"
    sha256 "e96da0d330793e2cb9485e9ddfd918d456036c7149416295932478192f4436a1"
  end

  resource "cryptography" do
    url "https://files.pythonhosted.org/packages/9d/0a/d7060601834b1a0a84845d6ae2cd59be077aafa2133455062e47c9733024/cryptography-2.9.tar.gz"
    sha256 "0cacd3ef5c604b8e5f59bf2582c076c98a37fe206b31430d0cd08138aff0986e"
  end

  resource "fabric" do
    url "https://files.pythonhosted.org/packages/f9/14/e81b9425d450de0f34d8c49b46133aa5554a7f4f1f1f2e7857e66dfa270b/fabric-2.5.0.tar.gz"
    sha256 "24842d7d51556adcabd885ac3cf5e1df73fc622a1708bf3667bf5927576cdfa6"
  end

  resource "humanfriendly" do
    url "https://files.pythonhosted.org/packages/2e/d1/e0d8db85b71fc6e7d5be7d78bb5db64c63790aec45acef6578190d66c666/humanfriendly-8.1.tar.gz"
    sha256 "25c2108a45cfd1e8fbe9cdb30b825d34ef5d5675c8e11e4775c9aedbfb0bdee2"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/cb/19/57503b5de719ee45e83472f339f617b0c01ad75cba44aba1e4c97c2b0abd/idna-2.9.tar.gz"
    sha256 "7588d1c14ae4c77d74036e8c22ff447b26d0fde8f007354fd48a7814db15b7cb"
  end

  resource "importlib-metadata" do
    url "https://files.pythonhosted.org/packages/b4/1b/baab42e3cd64c9d5caac25a9d6c054f8324cdc38975a44d600569f1f7158/importlib_metadata-1.6.0.tar.gz"
    sha256 "34513a8a0c4962bc66d35b359558fd8a5e10cd472d37aec5f66858addef32c1e"
  end

  resource "invoke" do
    url "https://files.pythonhosted.org/packages/b6/08/b345475cfaaa542ae78a172d5b23979ad0577f15a32b16e5e54b2a7e80c6/invoke-1.4.1.tar.gz"
    sha256 "de3f23bfe669e3db1085789fd859eb8ca8e0c5d9c20811e2407fa042e8a5e15d"
  end

  resource "isodate" do
    url "https://files.pythonhosted.org/packages/b1/80/fb8c13a4cd38eb5021dc3741a9e588e4d1de88d895c1910c6fc8a08b7a70/isodate-0.6.0.tar.gz"
    sha256 "2e364a3d5759479cdb2d37cce6b9376ea504db2ff90252a2e5b7cc89cc9ff2d8"
  end

  resource "javaproperties" do
    url "https://files.pythonhosted.org/packages/db/43/58b89453727acdcf07298fe0f037e45b3988e5dcc78af5dce6881d0d2c5e/javaproperties-0.5.1.tar.gz"
    sha256 "2b0237b054af4d24c74f54734b7d997ca040209a1820e96fb4a82625f7bd40cf"
  end

  resource "Jinja2" do
    url "https://files.pythonhosted.org/packages/64/a7/45e11eebf2f15bf987c3bc11d37dcc838d9dc81250e67e4c5968f6008b6c/Jinja2-2.11.2.tar.gz"
    sha256 "89aab215427ef59c34ad58735269eb58b1a5808103067f7bb9d5836c651b3bb0"
  end

  resource "jmespath" do
    url "https://files.pythonhosted.org/packages/5c/40/3bed01fc17e2bb1b02633efc29878dfa25da479ad19a69cfb11d2b88ea8e/jmespath-0.9.5.tar.gz"
    sha256 "cca55c8d153173e21baa59983015ad0daf603f9cb799904ff057bfb8ff8dc2d9"
  end

  resource "jsmin" do
    url "https://files.pythonhosted.org/packages/17/73/615d1267a82ed26cd7c124108c3c61169d8e40c36d393883eaee3a561852/jsmin-2.2.2.tar.gz"
    sha256 "b6df99b2cd1c75d9d342e4335b535789b8da9107ec748212706ef7bbe5c2553b"
  end

  resource "jsondiff" do
    url "https://files.pythonhosted.org/packages/64/5c/2b4b0ae4d42cb1b0b1a89ab1c4d9fe02c72461e33a5d02009aa700574943/jsondiff-1.2.0.tar.gz"
    sha256 "34941bc431d10aa15828afe1cbb644977a114e75eef6cc74fb58951312326303"
  end

  resource "knack" do
    url "https://files.pythonhosted.org/packages/09/d0/c473471b10fd231f8195256ac75f219a803579c8f7d07cbceeeed7b4ae4b/knack-0.7.0rc3.tar.gz"
    sha256 "27174c101ffce59c6baf6f71b19f97756d504b810777878cc2bc803254f15fd5"
  end

  resource "MarkupSafe" do
    url "https://files.pythonhosted.org/packages/b9/2e/64db92e53b86efccfaea71321f597fa2e1b2bd3853d8ce658568f7a13094/MarkupSafe-1.1.1.tar.gz"
    sha256 "29872e92839765e546828bb7754a68c418d927cd064fd4708fab9fe9c8bb116b"
  end

  resource "mock" do
    url "https://files.pythonhosted.org/packages/2e/35/594f501b2a0fb3732c8190ca885dfdf60af72d678cd5fa8169c358717567/mock-4.0.2.tar.gz"
    sha256 "dd33eb70232b6118298d516bbcecd26704689c386594f0f3c4f13867b2c56f72"
  end

  resource "msrest" do
    url "https://files.pythonhosted.org/packages/f6/0d/bc78f3d63a4d202d64ee8c706af4d84b5716a8052a7e1e79aed1915c49d5/msrest-0.6.13.tar.gz"
    sha256 "9050fbbb95dd9e8f4008d7227e4dc5662e8b605c89e5621b0dd09ac7f04cf01d"
  end

  resource "msrestazure" do
    url "https://files.pythonhosted.org/packages/33/09/3e739919833155dfa6126bcd00a406fb9beab7ca002022c65b7e7e9cd1eb/msrestazure-0.6.3.tar.gz"
    sha256 "0ec9db93eeea6a6cf1240624a04f49cd8bbb26b98d84a63a8220cfda858c2a96"
  end

  resource "oauthlib" do
    url "https://files.pythonhosted.org/packages/fc/c7/829c73c64d3749da7811c06319458e47f3461944da9d98bb4df1cb1598c2/oauthlib-3.1.0.tar.gz"
    sha256 "bee41cc35fcca6e988463cacc3bcb8a96224f470ca547e697b604cc697b2f889"
  end

  resource "paramiko" do
    url "https://files.pythonhosted.org/packages/ac/15/4351003352e11300b9f44a13576bff52dcdc6e4a911129c07447bda0a358/paramiko-2.7.1.tar.gz"
    sha256 "920492895db8013f6cc0179293147f830b8c7b21fdfc839b6bad760c27459d9f"
  end

  resource "portalocker" do
    url "https://files.pythonhosted.org/packages/7a/75/47453988b56b400fc73083123b15ac48f8488deec3d1060e3956dd03ee4e/portalocker-1.7.0.tar.gz"
    sha256 "091364838ed6fbb68ea291c28982d1e56125c0d9e3fad5a4ac001db54dd862dc"
  end

  resource "pycparser" do
    url "https://files.pythonhosted.org/packages/0f/86/e19659527668d70be91d0369aeaa055b4eb396b0f387a4f92293a20035bd/pycparser-2.20.tar.gz"
    sha256 "2d475327684562c3a96cc71adf7dc8c4f0565175cf86b6d7a404ff4c771f15f0"
  end

  resource "Pygments" do
    url "https://files.pythonhosted.org/packages/6e/4d/4d2fe93a35dfba417311a4ff627489a947b01dc0cc377a3673c00cf7e4b2/Pygments-2.6.1.tar.gz"
    sha256 "647344a061c249a3b74e230c739f434d7ea4d8b1d5f3721bc0f3558049b38f44"
  end

  resource "PyJWT" do
    url "https://files.pythonhosted.org/packages/2f/38/ff37a24c0243c5f45f5798bd120c0f873eeed073994133c084e1cf13b95c/PyJWT-1.7.1.tar.gz"
    sha256 "8d59a976fb773f3e6a39c85636357c4f0e242707394cadadd9814f5cbaa20e96"
  end

  resource "PyNaCl" do
    url "https://files.pythonhosted.org/packages/61/ab/2ac6dea8489fa713e2b4c6c5b549cc962dd4a842b5998d9e80cf8440b7cd/PyNaCl-1.3.0.tar.gz"
    sha256 "0c6100edd16fefd1557da078c7a31e7b7d7a52ce39fdca2bec29d4f7b6e7600c"
  end

  resource "pkginfo" do
    url "https://files.pythonhosted.org/packages/6c/04/fd6683d24581894be8b25bc8c68ac7a0a73bf0c4d74b888ac5fe9a28e77f/pkginfo-1.5.0.1.tar.gz"
    sha256 "7424f2c8511c186cd5424bbf31045b77435b37a8d604990b79d4e70d741148bb"
  end

  resource "pyOpenSSL" do
    url "https://files.pythonhosted.org/packages/0d/1d/6cc4bd4e79f78be6640fab268555a11af48474fac9df187c3361a1d1d2f0/pyOpenSSL-19.1.0.tar.gz"
    sha256 "9a24494b2602aaf402be5c9e30a0b82d4a5c67528fe8fb475e3f3bc00dd69507"
  end

  resource "python-dateutil" do
    url "https://files.pythonhosted.org/packages/be/ed/5bbc91f03fa4c839c4c7360375da77f9659af5f7086b7a7bdda65771c8e0/python-dateutil-2.8.1.tar.gz"
    sha256 "73ebfe9dbf22e832286dafa60473e4cd239f8592f699aa5adaf10050e6e1823c"
  end

  resource "pytz" do
    url "https://files.pythonhosted.org/packages/df/d5/3e3ff673e8f3096921b3f1b79ce04b832e0100b4741573154b72b756a681/pytz-2019.1.tar.gz"
    sha256 "d747dd3d23d77ef44c6a3526e274af6efeb0a6f1afd5a69ba4d5be4098c8e141"
  end

  resource "PyYAML" do
    url "https://files.pythonhosted.org/packages/64/c2/b80047c7ac2478f9501676c988a5411ed5572f35d1beff9cae07d321512c/PyYAML-5.3.1.tar.gz"
    sha256 "b8eac752c5e14d3eca0e6dd9199cd627518cb5ec06add0de9d32baeee6fe645d"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/f5/4f/280162d4bd4d8aad241a21aecff7a6e46891b905a4341e7ab549ebaf7915/requests-2.23.0.tar.gz"
    sha256 "b3f43d496c6daba4493e7c431722aeb7dbc6288f52a6e04e7b6023b0247817e6"
  end

  resource "requests-oauthlib" do
    url "https://files.pythonhosted.org/packages/23/eb/68fc8fa86e0f5789832f275c8289257d8dc44dbe93fce7ff819112b9df8f/requests-oauthlib-1.3.0.tar.gz"
    sha256 "b4261601a71fd721a8bd6d7aa1cc1d6a8a93b4a9f5e96626f8e4d91e8beeaa6a"
  end

  resource "scp" do
    url "https://files.pythonhosted.org/packages/05/e0/ac4169e773e12a08d941ca3c006cb8c91bee9d6d80328a15af850b5e7480/scp-0.13.2.tar.gz"
    sha256 "ef9d6e67c0331485d3db146bf9ee9baff8a48f3eb0e6c08276a8584b13bf34b3"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/21/9f/b251f7f8a76dec1d6651be194dfba8fb8d7781d10ab3987190de8391d08e/six-1.14.0.tar.gz"
    sha256 "236bdbdce46e6e6a3d61a337c0f8b763ca1e8717c03b369e87a7ec7ce1319c0a"
  end

  resource "sshtunnel" do
    url "https://files.pythonhosted.org/packages/c5/5c/4b320d7ec4b0d5d4d6df1fdf66a5799625b3623d0ce4efe81719c6f8dfb3/sshtunnel-0.1.5.tar.gz"
    sha256 "c813fdcda8e81c3936ffeac47cb69cfb2d1f5e77ad0de656c6dab56aeebd9249"
  end

  resource "tabulate" do
    url "https://files.pythonhosted.org/packages/57/6f/213d075ad03c84991d44e63b6516dd7d185091df5e1d02a660874f8f7e1e/tabulate-0.8.7.tar.gz"
    sha256 "db2723a20d04bcda8522165c73eea7c300eda74e0ce852d9022e0159d7895007"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/05/8c/40cd6949373e23081b3ea20d5594ae523e681b6f472e600fbc95ed046a36/urllib3-1.25.9.tar.gz"
    sha256 "3018294ebefce6572a474f0604c2021e33b3fd8006ecd11d62107a5d2a963527"
  end

  resource "vsts" do
    url "https://files.pythonhosted.org/packages/ce/fa/4405cdb2a6b0476a94b24254cdfb1df7ff43138a91ccc79cd6fc877177af/vsts-0.1.25.tar.gz"
    sha256 "da179160121f5b38be061dbff29cd2b60d5d029b2207102454d77a7114e64f97"
  end

  resource "vsts-cd-manager" do
    url "https://files.pythonhosted.org/packages/fc/cd/29c798a92d5f7a718711e4beace03612c93ad7ec2121aea606d8abae38ee/vsts-cd-manager-1.0.2.tar.gz"
    sha256 "0bb09059cd553e1c206e92ef324cb0dcf92334846d646c44c684f6256b86447b"
  end

  resource "websocket_client" do
    url "https://files.pythonhosted.org/packages/c5/01/8c9c7de6c46f88e70b5a3276c791a2be82ae83d8e0d0cc030525ee2866fd/websocket_client-0.56.0.tar.gz"
    sha256 "1fd5520878b68b84b5748bb30e592b10d0a91529d5383f74f4964e72b297fd3a"
  end

  resource "wheel" do
    url "https://files.pythonhosted.org/packages/fa/b4/f9886517624a4dcb81a1d766f68034344b7565db69f13d52697222daeb72/wheel-0.30.0.tar.gz"
    sha256 "9515fe0a94e823fd90b08d22de45d7bde57c90edce705b22f5e1ecf7e1b653c8"
  end

  resource "xmltodict" do
    url "https://files.pythonhosted.org/packages/58/40/0d783e14112e064127063fbf5d1fe1351723e5dfe9d6daad346a305f6c49/xmltodict-0.12.0.tar.gz"
    sha256 "50d8c638ed7ecb88d90561beedbf720c9b4e851a9fa6c47ebd64e99d166d8a21"
  end

  resource "zipp" do
    url "https://files.pythonhosted.org/packages/ce/8c/2c5f7dc1b418f659d36c04dec9446612fc7b45c8095cc7369dd772513055/zipp-3.1.0.tar.gz"
    sha256 "c599e4d75c98f6798c509911d08a22e6c021d074469042177c8c86fb92eefd96"
  end

  def install
    # Work around Xcode 11 clang bug
    # https://code.videolan.org/videolan/libbluray/issues/20
    ENV.append_to_cflags "-fno-stack-check" if DevelopmentTools.clang_build_version >= 1010

    venv = virtualenv_create(libexec, "python3")
    venv.pip_install resources

    # Get the CLI components we'll install
    components = [
      buildpath/"src/azure-cli",
      buildpath/"src/azure-cli-telemetry",
      buildpath/"src/azure-cli-core",
      buildpath/"src/azure-cli-nspkg",
      buildpath/"src/azure-cli-command_modules-nspkg",
    ]

    # Install CLI
    components.each do |item|
      cd item do
        venv.pip_install item
      end
    end

    (bin/"az").write <<~EOS
      #!/usr/bin/env bash
      AZ_INSTALLER=HOMEBREW #{libexec}/bin/python -m azure.cli \"$@\"
    EOS

    bash_completion.install "az.completion" => "az"
  end

  test do
    json_text = shell_output("#{bin}/az cloud show --name AzureCloud")
    azure_cloud = JSON.parse(json_text)
    assert_equal azure_cloud["name"], "AzureCloud"
    assert_equal azure_cloud["endpoints"]["management"], "https://management.core.windows.net/"
    assert_equal azure_cloud["endpoints"]["resourceManager"], "https://management.azure.com/"
  end
end
