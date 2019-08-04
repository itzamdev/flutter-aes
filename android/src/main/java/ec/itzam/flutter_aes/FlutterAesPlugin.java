package ec.itzam.flutter_aes;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/**
 * FlutterAesPlugin
 */
public class FlutterAesPlugin implements MethodCallHandler {
    /**
     * Plugin registration.
     */
    public static void registerWith(Registrar registrar) {
        final MethodChannel channel = new MethodChannel(registrar.messenger(), "ec.itzam/flutter_aes");
        channel.setMethodCallHandler(new FlutterAesPlugin());
    }

    @Override
    public void onMethodCall(MethodCall call, Result result) {

        String plainText = call.argument("plainText");
        String key = call.argument("key");

        switch (call.method) {
            case "encrypt":
                String encrypted = AES256Cryptor.encrypt(plainText, key);
                result.success(encrypted);
                break;
            case "decrypt":
                String decrypted = AES256Cryptor.decrypt(plainText, key);
                result.success(decrypted);
                break;
            default:
                result.notImplemented();
        }
    }
}
